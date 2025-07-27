defmodule PathvoidWeb.AboutLive do
  use PathvoidWeb, :live_view
  import PathvoidWeb.Components.Navigation, only: [navigation: 1]

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "About")}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-base-100">
      <.navigation />
      <main class="container mx-auto px-4 py-24">
        <div class="max-w-2xl mx-auto space-y-16">
          <div class="text-center space-y-6">
            <h1 class="text-4xl font-bold">About</h1>
            <p class="text-lg text-base-content/60">
              My journey towards digital privacy
            </p>
          </div>

          <div class="space-y-4">
            <h2 class="text-2xl font-semibold">Mission</h2>
            <p class="text-base-content/70 leading-relaxed">
              Reducing digital footprint through conscious choices about data and privacy, while maintaining usability and reducing subscription complexity.
            </p>
          </div>

          <div class="space-y-4">
            <h2 class="text-2xl font-semibold">My Approach</h2>
            <p class="text-base-content/70 leading-relaxed">
              I'm not going crazy about privacy, but I believe in making informed choices where it matters. My goal is to reduce my digital footprint where I can, while eliminating the need for multiple subscriptions across different services.
            </p>
            <p class="text-base-content/70 leading-relaxed">
              I'll share existing privacy-focused alternatives when they work well, and when they don't exist or don't meet my needs, I'll create my own solutions. This approach helps me consolidate services and reduce both costs and complexity.
            </p>
          </div>

          <div class="space-y-4">
            <h2 class="text-2xl font-semibold">What I Share</h2>
            <div class="grid gap-4">
              <div class="flex items-start space-x-3">
                <div class="w-2 h-2 bg-primary rounded-full mt-2"></div>
                <div>
                  <span class="font-medium">Privacy-focused alternatives</span>
                  <p class="text-sm text-base-content/60 mt-1">Tools and services that respect your data while being practical to use</p>
                </div>
              </div>
              <div class="flex items-start space-x-3">
                <div class="w-2 h-2 bg-primary rounded-full mt-2"></div>
                <div>
                  <span class="font-medium">Self-hosted solutions</span>
                  <p class="text-sm text-base-content/60 mt-1">When existing options don't cut it, I build my own alternatives</p>
                </div>
              </div>
              <div class="flex items-start space-x-3">
                <div class="w-2 h-2 bg-primary rounded-full mt-2"></div>
                <div>
                  <span class="font-medium">Consolidation strategies</span>
                  <p class="text-sm text-base-content/60 mt-1">Ways to reduce subscription fatigue and simplify your digital life</p>
                </div>
              </div>
            </div>
          </div>

          <div class="space-y-4">
            <h2 class="text-2xl font-semibold">Philosophy</h2>
            <p class="text-base-content/70 leading-relaxed">
              Practical privacy without sacrificing usability. Open source and community-driven solutions that actually work in real life, not just in theory.
            </p>
          </div>
        </div>
      </main>
    </div>
    """
  end
end
