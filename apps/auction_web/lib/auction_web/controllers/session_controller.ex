defmodule AuctionWeb.SessionController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    changeset = Auction.UserManager.new_session()
    error = nil
    render(conn, "index.html", changeset: changeset, error: error)
  end

  def create(conn, user) do
    # Attempt to authenticate the user
    case Auction.UserManager.login(user) do
      {:ok, token} ->
        conn
        |> put_flash(:info, "Welcome back token is #{token}")
        |> redirect(to: ~p"/")

      {:error, reason} ->
        changeset = Auction.UserManager.new_session()
        render(conn, "index.html", changeset: changeset, error: reason)
    end
  end

  def sign_up(conn, _params) do
    changeset = Auction.UserManager.new_session()
    render(conn, "signup.html", changeset: changeset)
  end

  def create_user(conn, %{"user" => user_params}) do
    case user_params.password != user_params.password_confirmation do
      true ->
        conn
        |> put_flash(:info, "Passwords do not match.")
        |> render("signup.html")
    end

    case Auction.UserManager.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: ~p"/")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "signup.html", changeset: changeset)
    end
  end
end
