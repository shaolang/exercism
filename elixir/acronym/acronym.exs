defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    ~r/[^\w\s]|(?:\w(?=[A-Z]))/
    |> Regex.replace(string, " ")
    |> String.split
    |> Enum.map_join(fn w -> w |> String.at(0) |> String.upcase end)
  end
end
