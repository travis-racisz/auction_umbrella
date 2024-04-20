defmodule AuctionWeb.SessionController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    changeset = Auction.UserManager.new_session()
    error = nil
    render(conn, "index.html", changeset: changeset, error: error)
  end

  def create(conn, user) do
    # Attempt to authenticate the user
    case Auction.UserManager.login(user) do
      {:ok, token} ->
        conn
        |> put_flash(:info, "Welcome back token is #{token}")
        |> redirect(to: ~p"/")

      {:error, reason} ->
        changeset = Auction.UserManager.new_session()
        render(conn, "index.html", changeset: changeset, error: reason)
    end
  end
end
