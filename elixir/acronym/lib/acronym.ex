defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.replace(~r{([a-z])([A-Z])([a-z])}, "\\1 \\2\\3")
    |> String.split(~r{ |-|_})
    |> Stream.map(fn word -> String.first word end)
    |> Enum.join("")
    |> String.upcase
  end
end
