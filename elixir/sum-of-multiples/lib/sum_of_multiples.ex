defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    1..(limit - 1)
    |> Stream.map(&(multiple(&1, factors)))
    |> Enum.sum
  end

  defp multiple(n, factors) do
    Enum.reduce_while(factors, 0, fn factor, _ ->
      case rem(n, factor) do
        0 -> {:halt, n}
        _ -> {:cont, 0}
      end
    end)
  end
end
