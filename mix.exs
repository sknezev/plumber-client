# Generated by usvc-1.14.1
# Feel free to adjust, it will not be overridden

defmodule PlumberClient.Mixfile do
  use Mix.Project

  def project do
    [app: :plumber_client,
     version: "0.2.0",
     elixir: "~> 1.6",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger],
     mod: {PlumberClient.Application, []},
   ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:protobuf, "~> 0.5.3"},
      {:google_protos, "~> 0.1"},
      #{:cowboy, "~> 1.1.0"},
      {:plug, "~> 1.3"},
#      {:poison, "~> 3.1"},
      {:httpoison, "~> 0.11"},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 0.3", only: :dev, runtime: false},
      {:grpc, github: "tony612/grpc-elixir"},
      {:util, github: "renderedtext/elixir-util"},
      {:uuid, "~> 1.1"},
    ]
  end
end
