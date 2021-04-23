defmodule Inmana.Restaurant.Create do
  alias Inmana.{Repo, Restaurant}
  # alias Inmana.Restaurant.Create
  # Create.call(params)
  def call(params) do
    params
    |> Restaurant.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  # module to handle success or fail to insert data
  defp handle_insert({:ok, %Restaurant{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: :bad_request}}
end
