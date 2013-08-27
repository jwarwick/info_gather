defmodule InfoGather.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  # def url, do: "ecto://dbuser:TooManySecrets@localhost/infogather"
  def url, do: "ecto://jwarwick@localhost/infogather"
end

defmodule InfoGather.DataEntity do
  use Ecto.Entity

  dataset "data" do
    field :entry, :string    
  end
end

