defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{id: 1, title: "item 1", description: "description 1", price: 100},
    %Item{id: 2, title: "item 2", description: "description 2", price: 200},
    %Item{id: 3, title: "item 3", description: "description 3", price: 300}
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, &(&1.id == id))
  end

  def get_by(Item, map) do
    Enum.find(@items, fn item ->
      Enum.all?(map, fn {key, value} ->
        Map.get(item, key) == value
      end)
    end)
  end
end
