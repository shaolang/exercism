defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    ~r{[,_.%@&!^:$]}
    |> Regex.replace(sentence, " ")
    |> String.downcase
    |> String.split
    |> Enum.frequencies
  end
end
