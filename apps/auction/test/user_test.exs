defmodule UserTest do
  use Auction.RepoCase

  test "create user" do
    assert {:ok, user} =
             Auction.UserManager.create_user(%{email: "user1", password: "password"})
  end

  test "get user by email " do
    assert {:ok, user} = Auction.UserManager.get_user_by_email(%{email: "user1"})
  end
end
