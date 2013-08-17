defmodule Beer do
  def verse(0) do
    "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
  def verse(1) do
    "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
  end
  def verse(n) do
    verse(n, n - 1)
  end
  def verse(n, 1) do
    "#{n} bottles of beer on the wall, #{n} bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall.\n"
  end
  def verse(n, remaining) do
    "#{n} bottles of beer on the wall, #{n} bottles of beer.\nTake one down and pass it around, #{remaining} bottles of beer on the wall.\n"
  end

  def sing(from) do
    sing(from, 0)
  end
  def sing(from, to) do
    Enum.map_join((from..to), "\n", verse &1) <> "\n"
  end
end
