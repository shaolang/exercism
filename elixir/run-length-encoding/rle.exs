defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> split_by("")
    |> Stream.chunk_by(fn s -> s end)
    |> Enum.map_join(fn xs -> Integer.to_string(Enum.count(xs)) <> Enum.at(xs, 0) end)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    counts = split_by(string, ~r/[A-Z]/)
    letters = split_by(string, ~r/\d/)

    counts
    |> Stream.map(fn c -> String.to_integer(c) end)
    |> Stream.zip(letters)
    |> Enum.map_join(fn {c, l} -> String.duplicate(l, c) end)
  end

  defp split_by(string, pattern) do
    string
    |> String.split(pattern)
    |> Enum.filter(fn s -> s != "" end)
  end
end
