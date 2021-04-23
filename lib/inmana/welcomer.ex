defmodule Inmana.Welcomer do

  # receber parametros - nome e idade do usuário
  # caso o nome seja banana e idade 42 - recebe mensagem especial
  # se for maior de idade - recebe mensagem normal
  # se for menor de idade - retornar um erro
  # temos que tratar o nome do usuário para entradas erradas "bAnANa" ou " Banana"

  def welcome(%{"name" => name, "age"=> age }) do

    age = String.to_integer(age)

    # pipe operator -> resultado da operação é passado para a próxima
    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age) # name is implicit inside a pipe

    # IO.inspect(name)
    # IO.inspect(age)

    end

    # patterns match
    # defp = private function
    defp evaluate("banana", 42) do
      {:ok, "You are very special Banana"}
    end

    defp evaluate(name, age) when age >= 18 do
      {:ok, "Welcome #{name}"}
    end

    defp evaluate(name, _age) do
      {:error, "You shall not pass #{name}"}
    end

end


# Inmana.Welcomer.welcome(%{"name" => "Banana", "age"=> "42" })
