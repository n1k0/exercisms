defmodule Teenager do
  def hey(input) do
    cond do
      silent?(input)   -> "Fine. Be that way!"
      question?(input) -> "Sure."
      shouting?(input) -> "Woah, chill out!"
      :otherwise       -> "Whatever."
    end
  end

  defp shouting?(input), do: input == String.upcase input

  defp question?(input), do: "?" == String.last input

  defp silent?(nil),   do: true
  defp silent?(input), do: "" == String.strip input
end
