defmodule RotationalCipher do
  @uppercase Enum.to_list(?A..?Z)
  @lowercase Enum.to_list(?a..?z)

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    map = mapping(shift)

    text
    |> String.to_charlist()
    |> Enum.map(fn c -> Map.get(map, c, c) end)
    |> List.to_string
  end

  defp mapping(shift) do
    {as, bs} = Enum.split(@uppercase, shift)
    {cs, ds} = Enum.split(@lowercase, shift)

    Stream.zip([@uppercase ++ @lowercase, bs ++ as ++ ds ++ cs])
    |> Enum.into(%{})
  end
end
