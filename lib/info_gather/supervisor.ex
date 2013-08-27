defmodule InfoGather.Supervisor do
  use Supervisor.Behaviour

  def start_link(args) do
    :supervisor.start_link(__MODULE__, args)
  end

  def init(_args) do
    children = [ 
      worker(InfoGather.Repo, []),
      supervisor(InfoGather.Dynamo, []) 
      ]
    supervise children, strategy: :one_for_one
  end  

end

