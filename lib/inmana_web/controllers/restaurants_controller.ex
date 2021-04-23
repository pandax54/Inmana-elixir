defmodule InmanaWeb.RestaurantsController do
  use InmanaWeb, :controller

  alias Inmana.Restaurant # com aliás poderemos chamar esse módulo apenas por Welcomer
  alias Inmana.Restaurant.Create, as: RestaurantCreate

  alias InmanaWeb.FallbackController
  action_fallback FallbackController # o fallback liderá com os erros

  @spec create(any, :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}) ::
          {:error, %{result: any, status: :bad_request}} | Plug.Conn.t()
  def create(conn, params) do
  # with concatenar chamadas de funcao
    # with {} <- Module.funcao()

    with {:ok, %Restaurant{} = restaurant} <- Inmana.create_restaurant(params) do
      # devolver o erro pra quem chamou
        conn  # se a conexão tiver sucesso
        |> put_status(:created)
        |> render("create.json", restaurant: restaurant) # renderizar view -> criar com o mesmo padrao de nome do controller
      end
    end


  end
