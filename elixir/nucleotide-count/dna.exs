defmodule DNA do
  @nucleotides 'CGAT'

  def count(sequence, n) do
    Enum.count(sequence, fn(x) -> n == x end)
  end

  def nucleotide_counts(sequence) do
    HashDict.new @nucleotides, fn n -> {n, count(sequence, n)} end
  end
end
