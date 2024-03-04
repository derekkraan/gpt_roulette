defmodule GptRoulette.MixProject do
  use Mix.Project

  def project do
    [
      app: :gpt_roulette,
      version: "1997.8.29",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp package() do
    [
      description: "for AI Maximalists only",
      licenses: ["MIT"],
      maintainers: ["Derek Kraan"],
      links: %{GitHub: "https://github.com/derekkraan/gpt_roulette"}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:langchain, "~> 0.1.0"},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end
