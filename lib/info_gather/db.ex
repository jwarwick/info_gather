defmodule InfoGather.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url do
    do_url(System.get_env("DATABASE_URL"))
  end

  defp do_url(nil) do
    user = case System.get_env("USER") do
      nil -> "postgres"
      x -> x
    end
    "ecto://#{user}@localhost/infogather"
  end

  # Sample DATABASE_URL from Heroku
  # postgres://user3123:passkja83kd8@ec2-117-21-174-214.compute-1.amazonaws.com:6212/db982398
  defp do_url(x), do: String.replace(x, %r{^postgres}, "ecto")

end

defmodule InfoGather.DataModel do
  use Ecto.Model

  queryable "data" do
    field :entry, :string    
  end
end

defmodule InfoGather.ClassroomModel do
  use Ecto.Model

  queryable "classroom" do
    field :grade_level, :integer
    field :name, :string
  end

  def get_classrooms() do
    [{0, "Pre-school, Teacher A"}, {1, "Pre-school, Teacher B"}, 
     {2, "Kindergarten"}, {3, "First Grade"},
     {4, "Second Grade"}, {5, "Third Grade"}, {6, "Fourth Grade"},
     {7, "Fifth Grade"}, {8, "Sixth Grade"}]
  end
end

defmodule InfoGather.BusModel do
  use Ecto.Model

  queryable "bus" do
    field :name, :string
  end

  def get_buses() do
    [{0, "None"}, {1, "Bus 1"}, {2, "Bus 2"}, {3, "Bus 3"}]
  end
end

