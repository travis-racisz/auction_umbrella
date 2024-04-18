defmodule Auction.UserManager do
  alias Auction.{Repo, User}
  @repo Repo
  def create_user(attr) do
    %User{}
    |> User.changeset(attr)
    |> @repo.insert()
  end

  def login({email, plain_text_password}) do
    case get_user_by_email(%{email: email}) do
      {:ok, user} ->
        if Argon2.verify_pass(plain_text_password, user.password) do
          {:ok, user}
        else
          {:error, "Invalid email or password"}
        end

      {:error, _reason} ->
        {:error, "Invalid email or password"}
    end
  end

  def get_user_by_email(%{email: email}) do
    case @repo.get_by!(User, email: email) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  def get_user_by_id(id) do
    case @repo.get_by!(User, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
