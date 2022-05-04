defmodule AuthpracticeWeb.Router do
  use AuthpracticeWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {AuthpracticeWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :auth do
    plug(AuthpracticeWeb.Pipeline)
  end

  pipeline :ensure_auth do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :allowed_for_users do
    plug(AuthpracticeWeb.Plugs.AuthorizationPlug, ["Admin", "Manager", "User"])
  end

  pipeline :allowed_for_managers do
    plug(AuthpracticeWeb.Plugs.AuthorizationPlug, ["Admin", "Manager"])
  end

  pipeline :allowed_for_admins do
    plug(AuthpracticeWeb.Plugs.AuthorizationPlug, ["Admin"])
  end

  scope "/", AuthpracticeWeb do
    pipe_through([:browser, :auth])

    get("/", PageController, :index)
    get("/login", SessionController, :new)
    post("/login", SessionController, :login)
    get("/logout", SessionController, :logout)
  end

  scope "/", AuthpracticeWeb do
    pipe_through([:browser, :auth, :ensure_auth, :allowed_for_users])

    get("/user_scope", PageController, :user_index)
  end

  scope "/", AuthpracticeWeb do
    pipe_through([:browser, :auth, :ensure_auth, :allowed_for_managers])

    get("/manager_scope", PageController, :manager_index)
  end

  scope "/admin", AuthpracticeWeb do
    pipe_through([:browser, :auth, :ensure_auth, :allowed_for_admins])

    resources("/users", UserController)
    get("/", PageController, :admin_index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", AuthpracticeWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: AuthpracticeWeb.Telemetry)
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through(:browser)

      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
