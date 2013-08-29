defmodule Mix.Tasks.Compile.CoffeeScript do
  use Mix.Task

  @shortdoc "Compile coffeescript files to javascript"

  @moduledoc """
  Compiles all web/scripts/*.coffee files to the corresponding priv/static/js/*.js files
  """
  def run(_args) do
    Mix.shell.info "Compiling coffeescript files..."
    Mix.shell.cmd "coffee --compile --output priv/static/js/ web/scripts/"
  end
end

