defmodule PathvoidWeb.ConnCase do
  @moduledoc """
  Test case for tests requiring connection setup.

  Provides Phoenix.ConnTest functionality and database sandbox
  for connection-based tests. Database changes are reverted
  after each test.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      @endpoint PathvoidWeb.Endpoint

      use PathvoidWeb, :verified_routes

      import Plug.Conn
      import Phoenix.ConnTest
      import PathvoidWeb.ConnCase
    end
  end

  setup tags do
    Pathvoid.DataCase.setup_sandbox(tags)
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
