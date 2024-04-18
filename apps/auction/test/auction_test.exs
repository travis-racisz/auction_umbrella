defmodule AuctionTest do
  use Auction.RepoCase

  doctest Auction

  test "the truth" do
    assert 1 + 1 == 2
  end

  test "List all items" do
    assert length(Auction.list_items()) != 0
  end

  test "get first item in database" do
    assert Auction.get_item(%{id: 1}) != nil
  end

  test "insert new item" do
    assert {:ok, item} =
             Auction.insert_item(%{
               title: "new item",
               description: "new item description",
               price: 100
             })
  end

  test "Delete Item from Database using the title" do
    assert {:ok, item} = Auction.delete_item(%{id: 1})
  end

  test "Update First Item in the Database" do
    assert {:ok, item} =
             Auction.update_item(%{id: 1}, %{
               id: 1,
               title: "updated item",
               description: "updated item description",
               price: 100
             })
  end

  test "Fail to insert new item because of a missing required property" do
    assert {:error, changeset} =
             Auction.insert_item(%{
               title: "new item",
               price: 100
             })
  end
end
