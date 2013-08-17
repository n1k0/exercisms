defmodule Anagram do
  def match(word, words) do
    words
    |> exclude_similar(word)
    |> select_anagrams(fingerprint(word))
  end

  def exclude_similar(words, word) do
    Enum.filter(words, &different?(word, &1))
  end

  defp select_anagrams(words, fingerprint) do
    Enum.filter(words, &anagram?(fingerprint, &1))
  end

  defp different?(word1, word2) do
    word1 != word2
  end

  def anagram?(fingerprint1, word) do
    fingerprint1 == fingerprint(word)
  end

  defp fingerprint(word) do
    word
    |> String.downcase
    |> String.to_char_list!
    |> Enum.sort
  end
end
