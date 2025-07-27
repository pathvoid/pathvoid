defmodule PathvoidWeb.ErrorHTML do
  @moduledoc """
  Error page rendering for HTML requests.
  """

  use PathvoidWeb, :html

  def render(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
