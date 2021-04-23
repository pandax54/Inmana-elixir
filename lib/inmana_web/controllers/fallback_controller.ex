defmodule InmanaWeb.FallbackController do
  use InmanaWeb, :controller

  alias InmanaWeb.ErrorView

  # o erro já definido no restaurants -> create.ex
  def call(conn, {:error, %{result: result, status: status}}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView) # como iremos renderizar a error view mas ela nao tem o padrao de mesmo nome do controller temos que configurar dessa forma
    |> render("error.json", result: result)
  end
  end
