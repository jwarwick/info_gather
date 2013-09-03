defmodule Mix.Tasks.Db.Create do
  use Mix.Task
  alias Ecto.Adapters.Postgres

  require InfoGather.Repo

  @shortdoc "Create required database tables (doesn't populate them)"

  @moduledoc """
  Creates the needed postgres tables (data, classroom, bus). Doesn't populate them.
  """
  def run(args) do
    Mix.shell.info "Creating database tables..."
    Mix.Task.run "app.start", args
    tables = 
      ["CREATE TABLE IF NOT EXISTS data (id serial PRIMARY KEY, entry text)",
       "CREATE TABLE IF NOT EXISTS classroom (id serial PRIMARY KEY, grade_level integer NOT NULL, name text)",
       "CREATE TABLE IF NOT EXISTS bus (id serial PRIMARY KEY, name text)"
      ]
    Enum.each tables, fn(sql) ->
      Mix.shell.info "Executing: #{sql}"
      result = Postgres.query(InfoGather.Repo, sql)
      IO.inspect result
    end
  end
end

