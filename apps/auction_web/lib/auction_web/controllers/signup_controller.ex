defmodule AuctionWeb.SignupController do
  use AuctionWeb, :controller

  def index(conn, _params) do
    changeset = Auction.UserManager.new_session()
    render(conn, "signup.html", changeset: changeset)
  end

  def create(conn, %{
        "user" => %{
          "email" => email,
          "password" => password,
          "password_confirmation" => password_confirmation
        }
      }) do
    case password != password_confirmation do
      true ->
        changeset = Auction.UserManager.new_session()

        conn
        |> put_flash(:error, "Passwords do not match.")
        |> render("signup.html", changeset: changeset)

      _ ->
        case Auction.UserManager.create_user(%{email: email, password: password}) do
          {:ok, _user} ->
            conn
            |> put_flash(:info, "Welcome #{email}.")
            |> redirect(to: ~p"/")

          {:error, %Ecto.Changeset{} = changeset} ->
            render(conn, "signup.html", changeset: changeset)
        end
    end
  end
end
