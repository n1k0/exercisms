defmodule Beer do
  def verse(0),    do: verse(0, 99)
  def verse(n),    do: verse(n, n - 1)
  def verse(n, r), do: render(n, r)

  def sing(from),     do: sing(from, 0)
  def sing(from, to), do: assemble(from, to)

  defp format_bottles(0), do: "no more bottles of beer"
  defp format_bottles(1), do: "1 bottle of beer"
  defp format_bottles(n), do: "#{n} bottles of beer"

  defp format_action(0), do: "Go to the store and buy some more"
  defp format_action(1), do: "Take it down and pass it around"
  defp format_action(n), do: "Take one down and pass it around"

  defp render(n, remaining) do
    bottles = format_bottles(n)
    action = format_action(n)
    remaining = format_bottles(remaining)
    String.capitalize("#{bottles} on the wall, #{bottles}.\n")
                   <> "#{action}, #{remaining} on the wall.\n"
  end

  defp assemble(from, to) do
    Enum.map_join((from..to), "\n", verse &1) <> "\n"
  end
end
