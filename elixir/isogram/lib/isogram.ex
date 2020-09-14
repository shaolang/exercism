defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    original = sentence
               |> String.downcase
               |> String.replace(~r{[^a-z]}, "")

    uniques_count = original
    |> String.graphemes
    |> Enum.into(%MapSet{})
    |> MapSet.size

    uniques_count == String.length(original)
  end
end
