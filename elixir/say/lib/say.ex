defmodule Say do
  @doc """
  Translate a positive integer into English.
  """
  @spec in_english(integer) :: {atom, String.t()}
  def in_english(0), do: {:ok, "zero"}
  def in_english(n) when n < 0 or n >= 1_000_000_000_000, do: {:error, "number is out of range"}
  def in_english(n) do
    ns = Integer.digits(n)
    nss = ns
          |> Enum.reverse
          |> Stream.chunk_every(3)
          |> Stream.map(&Enum.reverse/1)
          |> Stream.zip(["", " thousand", " million", " billion"])
          |> Stream.filter(fn {vs, _} -> vs != [0, 0, 0] end)
          |> Enum.reverse
          |> Stream.map(fn {ds, suffix} -> "#{hto(ds)}#{suffix}" end)
          |> Enum.join(" ")
          |> String.trim
    {:ok, nss}
  end

  defp hto([o]), do: ~W{one two three four five six seven eight nine} |> Enum.at(o - 1)
  defp hto([0, o]), do: hto([o])
  defp hto([1, o]) do
    ~W{ten eleven twelve thirteen fourteen fifteen sixteen seventeen eighteen nineteen}
    |> Enum.at(o)
  end
  defp hto([t, 0]) do
    ~W{twenty thirty forty fifty sixty seventy eighty ninety} |> Enum.at(t - 2)
  end
  defp hto([t, o]), do: "#{hto([t, 0])}-#{hto([o])}"
  defp hto([0, t, o]), do: hto([t, o])
  defp hto([h, 0, 0]), do: "#{hto([h])} hundred"
  defp hto([h, t, o]), do: "#{hto([h])} hundred #{hto([t, o])}"
end
