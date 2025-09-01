defmodule PathvoidWeb.VenusflytrapController do
  use PathvoidWeb, :controller

  def create_alert(conn, params) do
    case validate_alert_params(params) do
      {:ok, alert_data} ->
        case save_alert_to_file(alert_data) do
          {:ok, _} ->
            conn
            |> put_status(:created)
            |> json(%{message: "Alert saved successfully", data: alert_data})

          {:error, reason} ->
            conn
            |> put_status(:internal_server_error)
            |> json(%{error: "Failed to save alert", reason: reason})
        end

      {:error, reason} ->
        conn
        |> put_status(:bad_request)
        |> json(%{error: "Invalid alert data", reason: reason})
    end
  end

  def get_alerts_log(conn, _params) do
    alerts_dir = Path.join([:code.priv_dir(:pathvoid), "alerts"])
    log_file = Path.join(alerts_dir, "venusflytrap_alerts.txt")

    case File.read(log_file) do
      {:ok, content} ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(200, content)

      {:error, :enoent} ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(200, "No alerts logged yet.\n")

      {:error, reason} ->
        conn
        |> put_resp_content_type("text/plain")
        |> send_resp(500, "Error reading log file: #{reason}\n")
    end
  end

  defp validate_alert_params(params) do
    required_fields = ["temp_c", "temp_f", "hum"]

    case Enum.all?(required_fields, &Map.has_key?(params, &1)) do
      true ->
        # Validate that all values are numbers
        case validate_numeric_values(params) do
          {:ok, _} -> {:ok, params}
          {:error, reason} -> {:error, reason}
        end

      false ->
        {:error, "Missing required fields: #{Enum.join(required_fields, ", ")}"}
    end
  end

  defp validate_numeric_values(params) do
    numeric_fields = ["temp_c", "temp_f", "hum"]

    case Enum.all?(numeric_fields, fn field ->
      case params[field] do
        value when is_number(value) -> true
        value when is_binary(value) ->
          case Float.parse(value) do
            {_float, ""} -> true
            _ -> false
          end
        _ -> false
      end
    end) do
      true -> {:ok, params}
      false -> {:error, "All fields must be numeric values"}
    end
  end

    defp save_alert_to_file(alert_data) do
    # Create alerts directory if it doesn't exist
    alerts_dir = Path.join([:code.priv_dir(:pathvoid), "alerts"])
    File.mkdir_p!(alerts_dir)

    # Single alerts log file
    log_file = Path.join(alerts_dir, "venusflytrap_alerts.txt")

    # Get current time in GMT-4 (subtract 4 hours from UTC)
    current_time = DateTime.utc_now() |> DateTime.add(-4 * 3600, :second)
    formatted_time = Calendar.strftime(current_time, "%Y-%m-%d %H:%M:%S GMT-4")

    # Format as single line: timestamp | temp_c | temp_f | humidity
    alert_line = "#{formatted_time} | Temp C: #{alert_data["temp_c"]} | Temp F: #{alert_data["temp_f"]} | Humidity: #{alert_data["hum"]}%\n"

    # Append to log file
    case File.write(log_file, alert_line, [:append]) do
      :ok -> {:ok, log_file}
      {:error, reason} -> {:error, "Failed to write to log file: #{reason}"}
    end
  end
end
