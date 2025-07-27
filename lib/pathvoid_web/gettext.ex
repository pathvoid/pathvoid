defmodule PathvoidWeb.Gettext do
  @moduledoc """
  Internationalization module using Gettext.

  Provides translation functionality for the application.
  """

  use Gettext.Backend, otp_app: :pathvoid
end
