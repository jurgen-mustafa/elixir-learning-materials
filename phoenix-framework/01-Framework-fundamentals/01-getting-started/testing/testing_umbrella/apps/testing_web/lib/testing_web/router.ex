defmodule TestingWeb.Router do
  use TestingWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {TestingWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", TestingWeb do
    pipe_through(:browser)

    get("/", PageController, :index)

    resources("/users", UserController)

    # # this is basically everything below

    # get("/users/new", UserController, :new)
    # post("/users", UserController, :create)

    # get("/users", UserController, :index)
    # get("/users/:user_id", UserController, :show)

    # get("/users/:user_id/edit", UserController, :edit)
    # put("/users/:user_id", UserController, :update)
    # patch("/users/:user_id", UserController, :update)

    # delete("/users/:user_id", UserController, :delete)
  end

  # Other scopes may use custom stacks.
  # scope "/api", TestingWeb do
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

      live_dashboard("/dashboard", metrics: TestingWeb.Telemetry)
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
