case Mix.env() do 
  :dev -> items = [
      %{
        name: "Item 1",
        description: "Description 1",
        price: 100,
        user_id: 1
      },
      %{
        name: "Item 2",
        description: "Description 2",
        price: 200,
        user_id: 1
      },
      %{
        name: "Item 3",
        description: "Description 3",
        price: 300,
        user_id: 1
      }
    ]

    Enum.each(items, fn item ->
      Auction.insert_item(item) end)

    users = [
      %{
      email: "user1",
        password: "password",
      },
    ]
    Enum.each(users, fn user ->
      Auction.UserManager.create_user(user) end)
end
