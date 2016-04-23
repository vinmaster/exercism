defmodule Bob do
  def hey(input) do
    cond do
      is_silent? input -> "Fine. Be that way!"
      is_yelling? input -> "Whoa, chill out!"
      is_question? input -> "Sure."
      true -> "Whatever."
    end
  end

  def is_silent?(str) do
    String.strip(str) |> String.length == 0
  end

  def is_yelling?(str) do
    (has_char(str) or has_utf8(str)) and String.upcase(str) == str
  end

  def is_question?(str) do
    String.last(str) == "?"
  end

  def has_char(str) do
    String.match?(str, ~r/[a-zA-z]/)
  end

  def has_utf8(str) do
    str |> String.codepoints |> Enum.any?(fn x -> byte_size(x) == 2 end)
  end
end
