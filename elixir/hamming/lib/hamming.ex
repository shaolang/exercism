defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance(strand1, strand2) do
    case Enum.count(strand1) == Enum.count(strand2) do
      false -> {:error, "Lists must be the same length"}
      true ->
        {:ok, strand1
        |> Stream.zip(strand2)
        |> Stream.filter(fn {x, y} -> x != y end)
        |> Enum.count}
    end
  end
end
