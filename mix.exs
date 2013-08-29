defmodule InfoGather.Mixfile do
  use Mix.Project

  def project do
    [ app: :info_gather,
      version: "0.0.1",
      dynamos: [InfoGather.Dynamo],
      compilers: [:elixir, :dynamo, :app, :coffeeScript],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/info_gather/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { InfoGather, [] } ]
  end

  defp deps do
    [ 
      { :cowboy, github: "extend/cowboy" },
      { :dynamo, "0.1.0-dev", github: "elixir-lang/dynamo" },
      { :ecto, github: "elixir-lang/ecto" },
      { :pgsql, github: "semiocast/pgsql" }
    ]
  end
end
