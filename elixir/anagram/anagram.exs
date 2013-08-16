defmodule Anagram do
  def match(word, words) do
    Enum.filter(words, &filter_anagrams(fingerprint(word), &1))
  end

  defp different_words?(word1, word2) do
    word1 != word2
  end

  defp filter_anagrams(source, test_word) do
    different_words?(source, test_word) && source == fingerprint(test_word)
  end

  defp fingerprint(word) do
    word
    |> String.downcase
    |> String.to_char_list!
    |> Enum.sort
    |> String.from_char_list!
  end
end
