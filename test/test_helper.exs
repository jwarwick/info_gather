Dynamo.under_test(InfoGather.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule InfoGather.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end
