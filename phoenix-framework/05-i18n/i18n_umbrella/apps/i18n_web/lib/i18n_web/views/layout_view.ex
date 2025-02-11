# defmodule I18nWeb.LayoutView do
#   use I18nWeb, :view

#   # Phoenix LiveDashboard is available only in development by default,
#   # so we instruct Elixir to not warn if the dashboard route is missing.
#   @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}
# end

defmodule I18nWeb.LayoutView do
  use I18nWeb, :view

  def new_locale(conn, locale, language_title) do
    "<a href=\"#{Routes.page_path(conn, :index, locale: locale)}\">#{language_title}</a>" |> raw
  end
end
