defmodule AuctionWeb.ProfileController do
  use AuctionWeb, :controller

  @spec index(Plug.Conn.t(), map) :: Plug.Conn.t()
  def index(conn, %{current_user: user}) do
    {:ok, user} = Auction.UserManager.get_user_by_id(user.id)
    render(conn, "index.html", user: user)
  end
end
