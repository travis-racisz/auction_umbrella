defmodule Auction do
  alias Auction.{Repo, Item}

  @repo Repo

  @spec list_items() :: [Item.t()]
  @doc "Lists all items in the database"
  def list_items() do
    Item |> @repo.all()
  end

  @type id :: integer()
  @spec get_item(id) :: Item.t()
  @doc "Retrieves an item from the database by id"
  def get_item(id) do
    @repo.get_by!(Item, id)
  end

  @spec get_item_by(map) :: Item.t()
  @doc "Retrieves an item from the database by any attribute that the Item type can contain 
  (e.g. name, description, etc.)"
  def get_item_by(attrs) do
    @repo.get_by!(Item, attrs)
  end

  @doc "Inserts a new item into the database associated to a user
    TODO: recieve a token from the user to decode and get the user id from it
  "
  @spec insert_item(map, map) :: {:ok, Item.t()} | {:error, String.t()}
  def insert_item(%{id: id}, attrs) do
    case Auction.UserManager.get_user_by_id(%{id: id}) do
      {:ok, user} ->
        %Item{}
        |> Item.changeset(attrs)
        |> @repo.insert()

      {:error, reason} ->
        {:error, reason}
    end
  end

  @doc "Returns a changeset of the item to be used for forms in Phoenix"
  @spec new_item() :: Item.t()
  def new_item() do
    Item.changeset(%Item{})
  end

  @doc "Updates an item in the database"
  @spec update_item(integer, map) :: Item.t()
  def update_item(id, attrs) do
    get_item(id)
    |> Item.changeset(attrs)
    |> @repo.update()
  end

  @doc "deletes an item from the database"
  @spec delete_item(integer) :: Item.t()
  def delete_item(id) do
    get_item(id) |> @repo.delete()
  end
end
