defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    ~r/[!&@$%^&_:,]/
    |> Regex.replace(sentence, " ")
    |> String.split
    |> Enum.group_by(fn w -> String.downcase(w) end)
    |> Stream.map(fn {w, ws} -> {w, Enum.count(ws)} end)
    |> Enum.into(%{})
  end
end
