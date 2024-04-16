defmodule AuctionWeb.ItemController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    items = Auction.list_items()
    render(conn, "index.html", items: items)
  end

  def show(conn, %{"id" => id}) do
    item = Auction.get_item(id: id)
    render(conn, "show.html", item: item)
  end

  def new(conn, _params) do
    changeset = Auction.new_item()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"item" => item_params}) do
    {:ok, _item} = Auction.insert_item(item_params)

    conn
    |> put_flash(:info, "Item created successfully.")
    |> redirect(to: ~p"/items")
  end
end
