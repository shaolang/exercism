defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    base = String.downcase(base)
    base_letters = letters(base)

    candidates
    |> Enum.filter(fn w ->
      w = String.downcase(w)
      w != base && letters(w) == base_letters
    end)

  end

  defp letters(s), do: s |> String.graphemes |> Enum.sort
end
