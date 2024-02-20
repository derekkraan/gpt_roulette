defmodule GptRouletteTest do
  use ExUnit.Case

  import GptRoulette

  ~CHATGPT"""
  a function "add": adds two numbers together plus 1
  """

  test "greets the world" do
    assert add(1, 2) == 4
  end
end
