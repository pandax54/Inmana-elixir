defmodule InmanaWeb.WelcomeController do
use InmanaWeb, :controller

alias Inmana.Welcomer # com aliás poderemos chamar esse módulo apenas por Welcomer

def index(conn, params) do  # conn -> conexão, vamos devolver essa conexao modificada para o user, params -> dados recebidos
  params
  |> Welcomer.welcome()
  |> handle_response(conn)
end

# pattern match
defp handle_response({:ok, message}, conn) do
  conn
  |> put_status(:ok)
  |> json(%{message: message})
end

defp handle_response({:error, message}, conn) do
  conn
  |> put_status(:bad_request)
  |> json(%{message: message})
end

end
