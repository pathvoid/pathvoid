defmodule PathvoidWeb.HomeLive do
  use PathvoidWeb, :live_view
  import PathvoidWeb.Components.Navigation, only: [navigation: 1]

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Home")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-base-100">
      <.navigation />

      <main class="container mx-auto px-4 py-8 md:py-24">
        <div class="max-w-2xl mx-auto text-center space-y-12">
          <div class="space-y-8">
            <h1 class="text-6xl md:text-7xl font-bold">
              <span class="text-primary">Pathvoid</span>
            </h1>
            <p class="text-xl text-base-content/60">
              Digital privacy journey
            </p>
          </div>

          <div class="space-y-4">
            <p class="text-lg text-base-content/70">
              Reducing my digital footprint through conscious choices about data and privacy.
            </p>
            <p class="text-base text-base-content/60">
              Practical privacy without sacrificing usability.
            </p>
          </div>
        </div>
      </main>
    </div>
    """
  end
end
