defmodule Auction.UserManager do
  alias Auction.{Repo, User, Guardian}
  @repo Repo

  @doc "Creates a new user and inserts it into the database"
  @spec create_user(map) :: {:ok, User.t()} | {:error, String.t()}
  def create_user(attr) do
    %User{}
    |> User.changeset(attr)
    |> @repo.insert()
  end

  @spec login(map) :: {:ok, String.t()} | {:error, String.t()}
  @doc "Logs in a user and returns a JSON Web Token to be decoded on each request"

  def login(%{"user" => %{"email" => email, "password" => password}}) do
    case get_user_by_email(email) do
      {:ok, user} ->
        if Argon2.verify_pass(password, user.password) do
          # use guardian to generate token
          case Guardian.encode_and_sign(%{id: user.id}) do
            {:ok, token, _claims} -> {:ok, token}
            {:error, reason} -> {:error, "Error generating token: #{reason}"}
          end
        else
          {:error, "Invalid email or password"}
        end

      {:error, _reason} ->
        {:error, "invalid email or password"}
    end
  end

  @doc "Retrieves a user from the database by email"
  def get_user_by_email(email) do
    case @repo.get_by(User, email: email) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  @doc "Retrieves a user from the database by id"
  @type id :: integer()
  @spec get_user_by_id(id) :: {:ok, User.t()} | {:error, String.t()}
  def get_user_by_id(id) do
    case @repo.get_by(User, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end

  def new_session() do
    User.changeset(%User{})
  end
end
