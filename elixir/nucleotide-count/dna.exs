defmodule DNA do
  @defaults [{?C, 0}, {?G, 0}, {?A, 0}, {?T, 0}]

  def count(sequence, n) do
    Enum.count(sequence, fn(x) -> n == x end)
  end

  def nucleotide_counts(sequence) do
    Enum.reduce(sequence, HashDict.new(@defaults), &update_counts/2)
  end

  defp update_counts(n, counts) do
    HashDict.update(counts, n, 1, &1 + 1)
  end
end
