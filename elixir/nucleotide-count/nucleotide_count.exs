defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    unless Enum.member?(@nucleotides, nucleotide) &&
        Enum.all?(strand, fn c -> Enum.member? @nucleotides, c end)do
      raise ArgumentError
    end

    strand
    |> Enum.filter(fn n -> n == nucleotide end)
    |> length
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    @nucleotides
    |> Enum.map(fn c -> {c, count(strand, c)} end)
    |> Enum.into(%{})
  end
end
