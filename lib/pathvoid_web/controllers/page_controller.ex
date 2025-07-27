defmodule PathvoidWeb.PageController do
  @moduledoc """
  Controller for static pages.
  """

  use PathvoidWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
