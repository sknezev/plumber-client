defmodule PlumberClientTest do
  use ExUnit.Case
  doctest PlumberClient

  test "greets the world" do
    assert PlumberClient.hello() == :world
  end
end
