defmodule Auction do
  alias Auction.{Repo, Item}

  @repo Repo

  def list_items() do
    Item |> @repo.all()
  end

  def get_item(id) do
    @repo.get_by!(Item, id)
  end

  def get_item_by(attrs) do
    @repo.get_by!(Item, attrs)
  end

  def insert_item(attrs) do
    %Item{}
    |> Item.changeset(attrs)
    |> @repo.insert()
  end

  def new_item() do
    Item.changeset(%Item{})
  end

  def update_item(id, attrs) do
    get_item(id)
    |> Item.changeset(attrs)
    |> @repo.update()
  end

  def delete_item(id) do
    get_item(id) |> @repo.delete()
  end
end
