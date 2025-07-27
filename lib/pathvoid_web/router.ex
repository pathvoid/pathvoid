defmodule PathvoidWeb.Router do
  use PathvoidWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {PathvoidWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PathvoidWeb do
    pipe_through :browser

    live "/", HomeLive
    live "/about", AboutLive
    live "/projects", ProjectsLive
    live "/apps", AppsLive
  end

  if Application.compile_env(:pathvoid, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PathvoidWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
