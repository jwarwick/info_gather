defmodule InfoGather.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  # def url, do: "ecto://dbuser:TooManySecrets@localhost/infogather"
  def url, do: "ecto://jwarwick@localhost/infogather"
end

defmodule InfoGather.DataModel do
  use Ecto.Model

  queryable "data" do
    field :entry, :string    
  end
end

defmodule InfoGather.ClassroomModel do

  def get_classrooms() do
    [{0, "Pre-school, Teacher A"}, {1, "Pre-school, Teacher B"}, 
     {2, "Kindergarten"}, {3, "First Grade"},
     {4, "Second Grade"}, {5, "Third Grade"}, {6, "Fourth Grade"},
     {7, "Fifth Grade"}, {8, "Sixth Grade"}]
  end
end

defmodule InfoGather.BusModel do

  def get_buses() do
    [{0, "None"}, {1, "Bus 1"}, {2, "Bus 2"}, {3, "Bus 3"}]
  end
end

