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

defmodule InfoGather.GradeModel do

  def get_grades() do
    [{0, "Pre-school"}, {1, "Kindergarten"}, {2, "First Grade"},
     {3, "Second Grade"}, {4, "Third Grade"}, {5, "Fourth Grade"},
     {6, "Fifth Grade"}, {7, "Sixth Grade"}]
  end
end

defmodule InfoGather.TeacherModel do

  def get_teachers() do
    %b{[["Pre A", "Pre B", "Pre C"],
     ["K A", "K B"],
     ["First A"],
     ["Second A", "Second B", "Second C", "Second D"]]}
  end
end

defmodule InfoGather.BusModel do

  def get_buses() do
    [{0, "None"}, {1, "Bus 1"}, {2, "Bus 2"}, {3, "Bus 3"}]
  end
end

