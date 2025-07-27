defmodule PathvoidWeb.ProjectsLive do
  use PathvoidWeb, :live_view
  import PathvoidWeb.Components.Navigation, only: [navigation: 1]
  import Ecto.Query
  alias Pathvoid.{Repo, Project}

  @impl true
  def mount(_params, _session, socket) do
    completed_projects = Repo.all(from p in Project, where: p.status == "completed")
    work_in_progress = Repo.all(from p in Project, where: p.status != "completed")

    {:ok, assign(socket,
      page_title: "Projects",
      completed_projects: completed_projects,
      work_in_progress: work_in_progress
    )}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-base-100">
      <.navigation />
      <main class="container mx-auto px-4 py-8 md:py-24">
        <div class="max-w-4xl mx-auto space-y-16">
          <div class="text-center space-y-6">
            <h1 class="text-4xl font-bold">Projects</h1>
            <p class="text-lg text-base-content/60">
              A curated list of projects I've worked on or am actively developing. This page highlights completed initiatives as well as ongoing work, with a focus on personal development, self-hosting, and privacy-oriented solutions.
            </p>
          </div>

          <%= if length(assigns.completed_projects) > 0 do %>
            <div class="space-y-8">
              <h2 class="text-2xl font-semibold text-center">Completed</h2>
              <div class="space-y-6">
                <%= for project <- assigns.completed_projects do %>
                  <div class="card bg-base-200">
                    <div class="card-body">
                      <h3 class="card-title"><%= project.name %></h3>
                      <p class="text-base-content/70">
                        <%= project.description %>
                      </p>
                                           <%= if project.url && project.url != "" do %>
                       <div class="card-actions justify-end mt-4">
                         <a href={project.url} target="_blank" class="btn btn-primary btn-sm">View</a>
                       </div>
                     <% end %>
                    </div>
                  </div>
                <% end %>
              </div>
            </div>
          <% end %>

          <%= if length(assigns.work_in_progress) > 0 do %>
            <div class="space-y-8">
              <h2 class="text-2xl font-semibold text-center">Work in Progress</h2>
              <div class="space-y-6">
                <%= for project <- assigns.work_in_progress do %>
                  <div class="card bg-base-200">
                    <div class="card-body">
                      <h3 class="card-title"><%= project.name %></h3>
                      <p class="text-base-content/70">
                        <%= project.description %>
                      </p>
                                           <%= if project.url && project.url != "" do %>
                       <div class="card-actions justify-end mt-4">
                         <a href={project.url} target="_blank" class="btn btn-ghost btn-sm">View</a>
                       </div>
                     <% end %>
                    </div>
                  </div>
                <% end %>
              </div>
            </div>
          <% end %>
        </div>
      </main>
    </div>
    """
  end
end
