defmodule Inmana.Repo.Migrations.CreateRestaurantsTable do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      # ecto já gera ids automaticamente - como o sql
      # mas iremos utilizar o uuid como default
      add :email, :string
      add :name, :string

      timestamps()
    end

    # criar uma chave única para nao permitir que mais de um restaurante se cadastre com o mesmo email
    create unique_index(:restaurants, [:email])

  end
end
