defmodule Auction.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Auction.Repo

      import Ecto
      import Ecto.Query
      import Auction.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Auction.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Auction.Repo, {:shared, self()})
    end

    :ok
  end
end
