defmodule Words do
  def count(sentence) do
    sentence
    |> String.downcase
    |> to_words
    |> frequencies
  end

  defp to_words(sentence) do
    Regex.scan(%r/\w+/, sentence)
    |> List.concat
  end

  defp frequencies(words) do
    Enum.reduce(words, HashDict.new(), update_frequency(&1, &2))
  end

  defp update_frequency(word, counter) do
    HashDict.update(counter, word, 1, &1 + 1)
  end
end
