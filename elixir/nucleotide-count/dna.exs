defmodule DNA do
  @defaults [{?C, 0}, {?G, 0}, {?A, 0}, {?T, 0}]

  def count(sequence, n) do
    counts = nucleotide_counts(sequence)
    HashDict.get(counts, n) || 0
  end

  def nucleotide_counts(sequence) do
    Enum.reduce(sequence, HashDict.new(@defaults), &update_counts/2)
  end

  defp update_counts(n, counts) do
    HashDict.update(counts, n, 1, &1 + 1)
  end
end
