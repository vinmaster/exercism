defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence_with_no_symbols = remove_symbols(sentence)
    list_of_words = split_into_words(sentence_with_no_symbols)
    word_count = Enum.reduce(list_of_words, %{}, &increment_word_count/2)
    word_count
  end

  def remove_symbols(str) do
    String.replace(str, ~r/[_,:!&@%\^\$]/, " ")
  end

  def split_into_words(sentence) do
    String.split(sentence, ~r/\s/, trim: true)
  end

  def increment_word_count(word, map) do
    case_insensitive_word = String.downcase(word)
    case map[case_insensitive_word] do
      nil -> Map.put(map, case_insensitive_word, 1)
      _ -> %{map | case_insensitive_word => map[case_insensitive_word] + 1}
    end
  end
end
