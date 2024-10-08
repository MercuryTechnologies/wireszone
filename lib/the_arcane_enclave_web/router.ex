defmodule TheArcaneEnclaveWeb.Router do
  use TheArcaneEnclaveWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {TheArcaneEnclaveWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug Ueberauth
  end

  scope "/auth" do
    pipe_through [:browser, :auth]
    get "/:provider/callback", AuthController, :callback
  end

  scope "/", TheArcaneEnclaveWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/wires-search", WiresSearchController, :wires_search
    live "/column_inbound_international_wires", ColumnColumnInboundInternationalWiresLive.Index, :index
    live "/column_inbound_international_wires/new", ColumnColumnInboundInternationalWiresLive.Index, :new
    live "/column_inbound_international_wires/:id/edit", ColumnColumnInboundInternationalWiresLive.Index, :edit

    live "/column_inbound_international_wires/:id", ColumnColumnInboundInternationalWiresLive.Show, :show
    live "/column_inbound_international_wires/:id/show/edit", ColumnColumnInboundInternationalWiresLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", TheArcaneEnclaveWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:the_arcane_enclave, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: TheArcaneEnclaveWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
