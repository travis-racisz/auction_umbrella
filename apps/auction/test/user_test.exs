defmodule UserTest do
  use Auction.RepoCase

  test "create user" do
    assert {:ok, user} =
             Auction.UserManager.create_user(%{email: "user3", password: "password"})
  end

  test "get user by email " do
    assert {:ok, user} = Auction.UserManager.get_user_by_email(%{email: "user2"})
  end

  test "login user" do
    assert {:ok, token} = Auction.UserManager.login(%{email: "user2", password: "password"})
  end
end
