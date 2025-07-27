# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pathvoid.Repo.insert!(%Pathvoid.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Seed Apps
apps_data = [
  %{
    name: "Proton Calendar",
    url: "https://calendar.pathvoid.com",
    icon: "https://calendar.proton.me/assets/android-chrome-512x512.png",
    color: nil
  },
  %{
    name: "Proton Docs",
    url: "https://docs.pathvoid.com",
    icon: "https://docs.proton.me/assets/android-chrome-512x512.png",
    color: nil
  },
  %{
    name: "Proton Drive",
    url: "https://drive.pathvoid.com",
    icon: "https://drive.proton.me/assets/android-chrome-512x512.png",
    color: nil
  },
  %{
    name: "Proton Mail",
    url: "https://mail.pathvoid.com",
    icon: "https://mail.proton.me/assets/android-chrome-512x512.png",
    color: nil
  },
  %{
    name: "Proton Pass",
    url: "https://pass.pathvoid.com",
    icon: "https://pass.proton.me/assets/android-chrome-512x512.png",
    color: nil
  }
]

Enum.each(apps_data, fn app_data ->
  # Check if app already exists by name
  case Pathvoid.Repo.get_by(Pathvoid.App, name: app_data.name) do
    nil ->
      # App doesn't exist, insert it
      Pathvoid.Repo.insert!(Pathvoid.App.changeset(%Pathvoid.App{}, app_data))
      IO.puts("Added app: #{app_data.name}")
    _existing ->
      # App already exists, skip
      IO.puts("App already exists: #{app_data.name}")
  end
end)

IO.puts("Database seeded successfully!")
