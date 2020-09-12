defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t()) :: String.t()
  def encode(string) do
    string
    |> String.split("", trim: true)
    |> Stream.chunk_by(fn s -> s end)
    |> Enum.map_join(&encode_chunk/1)
  end

  @spec decode(String.t()) :: String.t()
  def decode(string) do
    ~r{(\d+)?(.)}
    |> Regex.scan(string, capture: :all_but_first)
    |> Enum.map_join(&decode_chunk/1)
  end

  defp encode_chunk([s]), do: s
  defp encode_chunk(xs), do: Integer.to_string(length(xs)) <> hd(xs)

  defp decode_chunk(["", s]), do: s
  defp decode_chunk([n, s]), do: Enum.join(List.duplicate(s, String.to_integer(n)))
end
