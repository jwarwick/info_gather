defmodule Mix.Tasks.Db.Seed do
  use Mix.Task

  require InfoGather.Repo
  import Ecto.Query

  @shortdoc "Create seed data for database tables"

  @moduledoc """
  Seed the need postgres tables with sample data for testing
  """
  def run(args) do
    Mix.shell.info "Seeding database tables..."
    Mix.Task.run "app.start", args

    from(b in InfoGather.BusModel)|> InfoGather.Repo.delete_all
    from(c in InfoGather.ClassroomModel) |> InfoGather.Repo.delete_all
    from(d in InfoGather.DataModel) |> InfoGather.Repo.delete_all

    classrooms = [{-1, "Pre-school, Teacher A"}, {-1, "Pre-school, Teacher B"}, 
     {0, "Kindergarten"}, {1, "First Grade"},
     {2, "Second Grade"}, {2, "Second Grade, Teacher C"}, {3, "Third Grade"}, {4, "Fourth Grade"},
     {6, "Fifth Grade"}, {8, "Sixth Grade"}]
    Enum.each classrooms, fn({level, name}) ->
      record = InfoGather.ClassroomModel.new(grade_level: level, name: name)
      InfoGather.Repo.create record
    end

    buses = [{"None"}, {"Bus A"}, {"Bus B"}, {"Bus C"}]
    Enum.each buses, fn({name}) ->
      record = InfoGather.BusModel.new(name: name)
      InfoGather.Repo.create record
    end

  end
end
