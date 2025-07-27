defmodule PathvoidWeb.AppsLive do
  use PathvoidWeb, :live_view
  import PathvoidWeb.Components.Navigation, only: [navigation: 1]
  alias Pathvoid.{Repo, App}

  @impl true
  def mount(_params, _session, socket) do
    apps = Repo.all(App)
    {:ok, assign(socket, page_title: "Apps", apps: apps)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-base-100">
      <.navigation />
      <main class="container mx-auto px-4 py-8 md:py-24">
        <div class="max-w-6xl mx-auto space-y-16">
          <div class="text-center space-y-6">
            <h1 class="text-4xl font-bold">Apps</h1>
            <p class="text-lg text-base-content/60">
              Privacy-focused solutions I use daily
            </p>
          </div>

          <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 xl:grid-cols-5 gap-6">
            <%= for app <- assigns.apps do %>
              <a href={app.url} target="_blank" class="btn btn-ghost flex-col h-32 py-6 px-2">
                <%= if String.starts_with?(app.icon, "http") do %>
                  <img src={app.icon} alt={app.name} class="w-16 h-16 mb-2" />
                <% else %>
                  <%= Phoenix.HTML.raw(app.icon) %>
                <% end %>
                <span class="text-sm"><%= app.name %></span>
              </a>
            <% end %>
          </div>
        </div>
      </main>
    </div>
    """
  end
end
