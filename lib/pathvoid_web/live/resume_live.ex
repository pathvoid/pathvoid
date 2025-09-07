defmodule PathvoidWeb.ResumeLive do
  use PathvoidWeb, :live_view
  import PathvoidWeb.Components.Navigation, only: [navigation: 1]

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, page_title: "Resume", language: :en)}
  end

  @impl true
  def handle_event("set_language", %{"language" => language}, socket) do
    new_language = String.to_atom(language)
    {:noreply, assign(socket, language: new_language)}
  end

  defp language_toggle(assigns) do
    ~H"""
    <div class="dropdown dropdown-end">
      <div tabindex="0" role="button" class="btn btn-info btn-sm">
        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5h12M9 3v2m1.048 9.5A18.022 18.022 0 016.412 9m6.088 9h7M11 21l5-10 5 10M12.751 5C11.783 10.77 8.07 15.61 3 18.129"></path>
        </svg>
        <%= if @language == :en, do: "EN", else: "FR" %>
      </div>
      <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-200 rounded-box w-32">
        <li><a phx-click="set_language" phx-value-language="en" class={if @language == :en, do: "active", else: ""}>English</a></li>
        <li><a phx-click="set_language" phx-value-language="fr" class={if @language == :fr, do: "active", else: ""}>Français</a></li>
      </ul>
    </div>
    """
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="min-h-screen bg-base-100">
      <.navigation />
      <main class="container mx-auto px-4 py-8 md:py-24">
        <div class="max-w-6xl mx-auto space-y-16">
          <div class="text-center space-y-6">
            <div class="flex items-center">
              <div class="flex-1"></div>
              <h1 class="text-4xl font-bold text-center flex-1">
                <%= if @language == :en, do: "Resume", else: "CV" %>
              </h1>
              <div class="flex-1 flex justify-end">
                <.language_toggle language={@language} />
              </div>
            </div>
            <p class="text-lg text-base-content/60">
              <%= if @language == :en, do: "Application Developer and Business Analyst", else: "Développeur d'applications et analyste d'affaires" %>
            </p>
          </div>

          <!-- Professional Experience -->
          <div class="space-y-8">
            <h2 class="text-2xl font-semibold text-center">
              <%= if @language == :en, do: "Professional Experience", else: "Expériences Professionnelles" %>
            </h2>

            <div class="card bg-base-200">
              <div class="card-body">
                <div class="flex justify-between items-start mb-4">
                  <h3 class="card-title text-xl">TELUS Communications</h3>
                  <span class="badge badge-primary">
                    <%= if @language == :en, do: "2011 - Present", else: "2011 - Présent" %>
                  </span>
                </div>

                <div class="space-y-6">
                  <!-- Current Role -->
                  <div class="border-l-4 border-primary pl-4">
                    <h4 class="font-semibold text-lg">
                      <%= if @language == :en, do: "Evolving Functions: Business Analysis & Project Management", else: "Fonctions évolutives: Analyse d'affaires & gestion de projets" %>
                    </h4>
                    <p class="text-sm text-base-content/60 mb-2">
                      <%= if @language == :en, do: "March 2025 - Present (unofficial)", else: "Mars 2025 - Présent (non officielles)" %>
                    </p>
                    <p class="text-base-content/70 mb-3">
                      <%= if @language == :en, do: "These responsibilities are added to my initial role in Information and Process Support, demonstrating progression towards a complete technical and analytical profile.", else: "Ces responsabilités s'ajoutent à mon rôle initial dans le Support aux informations et des processus, démontrant une progression vers un profil technique et analytique complet." %>
                    </p>
                    <ul class="list-disc list-inside space-y-1 text-sm">
                      <%= if @language == :en do %>
                        <li>Business analysis and automation project management mandates for all FFH back-offices.</li>
                        <li>Since July 2025, full-time assignment (100%) to these functions.</li>
                        <li>Writing functional specifications (business requirements) for internal tools, including a new ticket management system.</li>
                        <li>Understanding technical architectures (including REST APIs) to ensure consistency between business needs and proposed solutions.</li>
                        <li>Inter-team coordination (IT, operations, management) for successful project execution.</li>
                        <li>Excellent mastery of JIRA for defect tracking, prioritization, and collaboration with technical teams.</li>
                      <% else %>
                        <li>Mandats liés à l'analyse d'affaires et à la gestion de projets d'automatisation pour tous les back-offices FFH.</li>
                        <li>Depuis juillet 2025, affectation à temps plein (100%) à ces fonctions.</li>
                        <li>Rédaction de spécifications fonctionnelles (exigences métier) pour des outils internes, incluant un nouveau système de gestion de tickets.</li>
                        <li>Compréhension des architectures techniques (incluant les API REST) pour assurer la cohérence entre les besoins métier et les solutions proposées.</li>
                        <li>Coordination inter-équipes (IT, opérations, gestion) pour le bon déroulement des projets.</li>
                        <li>Très bonne maîtrise de JIRA pour le suivi des défauts, la priorisation et la collaboration avec les équipes techniques.</li>
                      <% end %>
                    </ul>
                  </div>

                  <!-- Previous Roles -->
                  <div class="space-y-4">
                    <div class="border-l-4 border-secondary pl-4">
                      <h4 class="font-semibold">
                        <%= if @language == :en, do: "Information and Process Support", else: "Support aux informations et des processus" %>
                      </h4>
                      <p class="text-sm text-base-content/60 mb-2">2022 - 2025</p>
                      <ul class="list-disc list-inside space-y-1 text-sm">
                        <li>
                          <%= if @language == :en, do: "Coordination between teams (customer service, technical, marketing, back-office, projects) to optimize processes, manage escalations, and improve operational efficiency, with a growing role in analysis and automation.", else: "Coordination entre les équipes (service client, technique, marketing, back-office, projets) pour optimiser les processus, gérer les escalades et améliorer l'efficacité opérationnelle, avec un rôle croissant dans l'analyse et l'automatisation." %>
                        </li>
                      </ul>
                    </div>

                    <div class="border-l-4 border-accent pl-4">
                      <h4 class="font-semibold">
                        <%= if @language == :en, do: "Back-office", else: "Back-office" %>
                      </h4>
                      <p class="text-sm text-base-content/60 mb-2">2020 - 2022</p>
                      <ul class="list-disc list-inside space-y-1 text-sm">
                        <li>
                          <%= if @language == :en, do: "Processing requests from various departments.", else: "Traitement des demandes de divers départements." %>
                        </li>
                        <li>
                          <%= if @language == :en, do: "Providing coaching to team members.", else: "Fourniture de coaching aux membres de l'équipe." %>
                        </li>
                        <li>
                          <%= if @language == :en, do: "Ensuring quality and proper follow-up of requests.", else: "Assurance de la qualité et du bon suivi des demandes." %>
                        </li>
                      </ul>
                    </div>

                    <div class="border-l-4 border-info pl-4">
                      <h4 class="font-semibold">
                        <%= if @language == :en, do: "Customer Service", else: "Service à la clientèle" %>
                      </h4>
                      <p class="text-sm text-base-content/60 mb-2">2019 - 2020</p>
                      <ul class="list-disc list-inside space-y-1 text-sm">
                        <li>
                          <%= if @language == :en, do: "Managing customer calls to meet their needs, provide personalized service, and offer appropriate solutions including sales.", else: "Gestion des appels clients pour répondre à leurs besoins, offrir un service personnalisé et proposer des solutions adaptées incluant les ventes." %>
                        </li>
                      </ul>
                    </div>

                    <div class="border-l-4 border-warning pl-4">
                      <h4 class="font-semibold">
                        <%= if @language == :en, do: "Competitive Call Center", else: "Centre d'appels compétitifs" %>
                      </h4>
                      <p class="text-sm text-base-content/60 mb-2">2011 - 2019</p>
                      <ul class="list-disc list-inside space-y-1 text-sm">
                        <li>
                          <%= if @language == :en, do: "Support for national and international calls, including 911 emergencies and assistance requests, ensuring fast, efficient, and accurate service.", else: "Support pour les appels nationaux et internationaux, incluant les urgences 911 et les demandes d'assistance, assurant un service rapide, efficace et précis." %>
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Education -->
          <div class="space-y-8">
            <h2 class="text-2xl font-semibold text-center">
              <%= if @language == :en, do: "Education", else: "Formations" %>
            </h2>

            <div class="card bg-base-200">
              <div class="card-body">
                <div class="flex justify-between items-start mb-4">
                  <h3 class="card-title text-xl">Cégep de Limoilou</h3>
                  <span class="badge badge-primary">2025</span>
                </div>
                <h4 class="font-semibold text-lg mb-3">
                  <%= if @language == :en, do: "DEC - Computer Science Techniques: Application Development", else: "DEC - Techniques de l'informatique : Développement d'applications" %>
                </h4>
                <ul class="list-disc list-inside space-y-2 text-sm">
                  <%= if @language == :en do %>
                    <li>Training focused on web and application development (front-end and back-end).</li>
                    <li>Practical projects completed with React, TypeScript, Elixir (Phoenix), and SQL.</li>
                    <li>Implementation of user interfaces, REST APIs, and relational database systems.</li>
                    <li>Development of personal projects, including a complete web application (frontend + backend) for physical progress management.</li>
                    <li>Familiarization with Linux systems (command line, development tools, deployment) and Windows server management (configuration, users, services).</li>
                    <li>Practical experience in game development, mobile application development, and computer security (best practices, basic vulnerability testing).</li>
                    <li>Use of Git and GitHub to version, document, and share project source code with the content specialist.</li>
                  <% else %>
                    <li>Formation axée sur le développement web et applicatif (front-end et back-end).</li>
                    <li>Projets pratiques réalisés avec React, TypeScript, Elixir (Phoenix) et SQL.</li>
                    <li>Mise en place d'interfaces utilisateurs, d'API REST, et de systèmes de base de données relationnelles.</li>
                    <li>Développement de projets personnels, incluant une application web complète (frontend + backend) pour la gestion de la progression physique.</li>
                    <li>Familiarisation avec les systèmes Linux (ligne de commande, outils de développement, déploiement) et gestion de serveurs Windows (configuration, utilisateurs, services).</li>
                    <li>Expériences pratiques en développement de jeux, développement d'applications mobiles, et sécurité informatique (bonnes pratiques, tests de vulnérabilité de base).</li>
                    <li>Utilisation de Git et GitHub pour versionner, documenter et partager le code source des projets avec le spécialiste de contenu.</li>
                  <% end %>
                </ul>
              </div>
            </div>

            <div class="card bg-base-200">
              <div class="card-body">
                <h3 class="card-title text-xl mb-3">
                  <%= if @language == :en, do: "TELUS Internal Training", else: "Formations internes TELUS" %>
                </h3>
                <ul class="list-disc list-inside space-y-2 text-sm">
                  <li>
                    <%= if @language == :en, do: "Mastery of call center communication.", else: "Maîtrise de la communication en centre d'appels." %>
                  </li>
                  <li>
                    <%= if @language == :en, do: "Customer service - Managing confrontations and conflicts.", else: "Service client - Gestion des confrontations et des conflits." %>
                  </li>
                  <li>
                    <%= if @language == :en, do: "Quality assurance and quality control.", else: "Assurance qualité et contrôle de qualité." %>
                  </li>
                </ul>
              </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div class="card bg-base-200">
                <div class="card-body">
                  <div class="flex justify-between items-start mb-2">
                    <h3 class="card-title text-lg">Cégep de Rimouski</h3>
                    <span class="badge badge-secondary">2006 - 2008</span>
                  </div>
                  <p class="font-semibold">
                    <%= if @language == :en, do: "Human Sciences", else: "Sciences humaines" %>
                  </p>
                  <p class="text-sm text-base-content/60">
                    <%= if @language == :en, do: "College Diploma (DEC)", else: "Diplôme d'étude collégiales (DEC)" %>
                  </p>
                </div>
              </div>

              <div class="card bg-base-200">
                <div class="card-body">
                  <div class="flex justify-between items-start mb-2">
                    <h3 class="card-title text-lg">
                      <%= if @language == :en, do: "Mont-Joli Adult Education Center", else: "Centre de formation des adultes de Mont-Joli" %>
                    </h3>
                    <span class="badge badge-secondary">2003 - 2004</span>
                  </div>
                  <p class="font-semibold">
                    <%= if @language == :en, do: "High School Diploma+", else: "Diplôme d'études secondaire+" %>
                  </p>
                  <p class="text-sm text-base-content/60">
                    <%= if @language == :en, do: "Training completed", else: "Formation complétée" %>
                  </p>
                </div>
              </div>
            </div>
          </div>

          <!-- Skills -->
          <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <div class="space-y-6">
              <h2 class="text-2xl font-semibold text-center">
                <%= if @language == :en, do: "Skills", else: "Compétences" %>
              </h2>

              <div class="card bg-base-200">
                <div class="card-body">
                  <h3 class="card-title text-lg mb-4">
                    <%= if @language == :en, do: "General Skills", else: "Compétences générales" %>
                  </h3>
                  <div class="flex flex-wrap gap-2">
                    <span class="badge badge-outline">Leadership</span>
                    <span class="badge badge-outline">
                      <%= if @language == :en, do: "Analysis", else: "Analyse" %>
                    </span>
                    <span class="badge badge-outline">
                      <%= if @language == :en, do: "Problem Solving", else: "Résolution de problèmes" %>
                    </span>
                    <span class="badge badge-outline">
                      <%= if @language == :en, do: "Communication", else: "Communication" %>
                    </span>
                    <span class="badge badge-outline">
                      <%= if @language == :en, do: "Teamwork", else: "Travail d'équipe" %>
                    </span>
                    <span class="badge badge-outline">
                      <%= if @language == :en, do: "Project Management", else: "Gestion de projets" %>
                    </span>
                    <span class="badge badge-outline">
                      <%= if @language == :en, do: "Adaptability", else: "Adaptabilité" %>
                    </span>
                  </div>
                </div>
              </div>

              <div class="card bg-base-200">
                <div class="card-body">
                  <h3 class="card-title text-lg mb-4">
                    <%= if @language == :en, do: "Technical Skills", else: "Compétences techniques" %>
                  </h3>
                  <div class="flex flex-wrap gap-2">
                    <span class="badge badge-primary">React</span>
                    <span class="badge badge-primary">TypeScript</span>
                    <span class="badge badge-primary">Elixir/Phoenix</span>
                    <span class="badge badge-primary">JavaScript</span>
                    <span class="badge badge-primary">SQL</span>
                    <span class="badge badge-primary">Git/GitHub</span>
                    <span class="badge badge-primary">API REST</span>
                    <span class="badge badge-primary">WebSocket</span>
                    <span class="badge badge-primary">Linux</span>
                    <span class="badge badge-primary">Windows</span>
                    <span class="badge badge-primary">Server</span>
                    <span class="badge badge-primary">JIRA</span>
                  </div>
                </div>
              </div>
            </div>

            <div class="space-y-6">
              <h2 class="text-2xl font-semibold text-center">
                <%= if @language == :en, do: "Languages & Awards", else: "Langues & Prix" %>
              </h2>

              <div class="card bg-base-200">
                <div class="card-body">
                  <h3 class="card-title text-lg mb-4">
                    <%= if @language == :en, do: "Languages", else: "Langues" %>
                  </h3>
                  <div class="space-y-2">
                    <div class="flex justify-between items-center">
                      <span class="font-medium"><%= if @language == :en, do: "French", else: "Français" %></span>
                      <span class="badge badge-success">
                        <%= if @language == :en, do: "Native language", else: "Langue maternelle" %>
                      </span>
                    </div>
                    <div class="flex justify-between items-center">
                      <span class="font-medium"><%= if @language == :en, do: "English", else: "Anglais" %></span>
                      <span class="badge badge-info">
                        <%= if @language == :en, do: "Fluent (professional level)", else: "Courant (niveau professionnel)" %>
                      </span>
                    </div>
                  </div>
                </div>
              </div>

              <div class="card bg-base-200">
                <div class="card-body">
                  <h3 class="card-title text-lg mb-4">
                    <%= if @language == :en, do: "Awards", else: "Prix" %>
                  </h3>
                  <div class="space-y-4">
                    <div class="border-l-4 border-warning pl-4">
                      <h4 class="font-semibold">TELUS Star</h4>
                      <p class="text-sm text-base-content/70">
                        <%= if @language == :en, do: "Awarded for rookie of the year.", else: "Récompensé pour recrue de l'année." %>
                      </p>
                    </div>
                    <div class="border-l-4 border-success pl-4">
                      <h4 class="font-semibold">Leading Star</h4>
                      <p class="text-sm text-base-content/70">
                        <%= if @language == :en, do: "Awarded five times for excellence and exceptional performance.", else: "Récompensé à cinq reprises pour l'excellence et la performance exceptionnelle." %>
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- Contact -->
          <div class="space-y-8">
            <h2 class="text-2xl font-semibold text-center">
              <%= if @language == :en, do: "Contact", else: "Contact" %>
            </h2>

            <div class="card bg-base-200">
              <div class="card-body">
                <h3 class="card-title text-lg mb-4">
                  <%= if @language == :en, do: "Get in Touch", else: "Entrer en contact" %>
                </h3>
                <div class="space-y-3">
                  <div class="flex items-center gap-3">
                    <svg class="w-5 h-5 text-primary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                    </svg>
                    <div>
                      <a href="mailto:contact@pathvoid.com" class="link link-primary font-medium">contact@pathvoid.com</a>
                      <span class="badge badge-success badge-sm ml-2">
                        <%= if @language == :en, do: "Preferred", else: "Préféré" %>
                      </span>
                    </div>
                  </div>
                  <div class="flex items-center gap-3">
                    <svg class="w-5 h-5 text-secondary" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                    </svg>
                    <a href="mailto:martin_larouche@live.com" class="link link-secondary">martin_larouche@live.com</a>
                  </div>
                  <p class="text-sm text-base-content/70 mt-3">
                    <%= if @language == :en, do: "I prefer contact@pathvoid.com as I plan to migrate to this address in the future.", else: "Je préfère contact@pathvoid.com car j'ai l'intention de migrer vers cette adresse à l'avenir." %>
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
    """
  end
end
