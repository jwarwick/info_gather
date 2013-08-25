defmodule InfoGather.Dynamo do
  use Dynamo

  config :dynamo,
    # The environment this Dynamo runs on
    env: Mix.env,

    # The OTP application associated to this Dynamo
    otp_app: :info_gather,

    # The endpoint to dispatch requests to
    endpoint: ApplicationRouter,

    # The route from where static assets are served
    # You can turn off static assets by setting it to false
    static_route: "/static"

  # Uncomment the lines below to enable the cookie session store
  # config :dynamo,
  #   session_store: Session.CookieStore,
  #   session_options:
  #     [ key: "_info_gather_session",
  #       secret: "0wGMkr+cupZSV6v5awet1Y1p4JLUtlnKX6qtPuttkdE4Zoj9PO1DTs54Lce0vUSm"]

  # Default functionality available in templates
  templates do
    use Dynamo.Helpers
  end
end
