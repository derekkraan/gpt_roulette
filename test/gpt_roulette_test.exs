defmodule GptRouletteTest do
  use ExUnit.Case
  doctest GptRoulette

  test "greets the world" do
    assert GptRoulette.hello() == :world
  end
end
