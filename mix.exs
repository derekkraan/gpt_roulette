defmodule GptRoulette.MixProject do
  use Mix.Project

  def project do
    [
      app: :gpt_roulette,
      version: "4.20",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:langchain, "~> 0.1.0"}
    ]
  end
end
