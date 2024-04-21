defmodule AuctionUmbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      name: "ElixAuction",
      source_url: "https://github.com/travis-racisz/auction_umbrella",
      docs: [
        # The main page in the docs
        main: "ElixAuction",
        extras: ["README.md"]
      ]
    ]
  end

  defp aliases() do
    [
      "phx.routes": "phx.routes AuctionWeb.Router"
    ]
  end

  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    [
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
    ]
  end
end
