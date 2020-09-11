defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    ~r{^(\w)|\s_?(\w)|[a-z-]([A-Z])}
    |> Regex.scan(string, capture: :all_but_first)
    |> Enum.join("")
    |> String.upcase
  end
end
