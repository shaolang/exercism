defmodule Scrabble do
  @scores [
    "aeioulnrst", "dg", "bcmp", "fhvwy", "k",
    "",           "",   "jx",   "",      "qz"]

  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t()) :: non_neg_integer
  def score(word) do
    word
    |> String.downcase
    |> String.split("", trim: true)
    |> Stream.map(&letter_score/1)
    |> Enum.sum
  end


  defp letter_score(letter) do
    @scores
    |> Stream.with_index
    |> Enum.reduce_while(0, fn {ls, index}, _ ->
      case String.contains?(ls, letter) do
        true -> {:halt, index + 1}
        _    -> {:cont, 0}
      end
    end)
  end
end
