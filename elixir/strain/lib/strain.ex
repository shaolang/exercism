defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    keep(list, fun, [])
  end

  defp keep([], _, remains), do: reverse(remains, [])
  defp keep([x|xs], fun, remains) do
    keep(xs, fun, (if fun.(x), do: [x|remains], else: remains))
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    complement = fn x -> !fun.(x) end

    keep(list, complement, [])
  end

  defp reverse([], result), do: result
  defp reverse([x|xs], result), do: reverse(xs, [x|result])
end
