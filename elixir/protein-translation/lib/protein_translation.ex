defmodule ProteinTranslation do
  @translation %{
  "UGU" => "Cysteine",      "UGC" => "Cysteine",    "UUA" => "Leucine",
  "UUG" => "Leucine",       "AUG" => "Methionine",  "UUU" => "Phenylalanine",
  "UUC" => "Phenylalanine", "UCU" => "Serine",      "UCC" => "Serine",
  "UCA" => "Serine",        "UCG" => "Serine",      "UGG" => "Tryptophan",
  "UAU" => "Tyrosine",      "UAC" => "Tyrosine",    "UAA" => "STOP",
  "UAG" => "STOP",          "UGA" => "STOP"}

  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: {atom, list(String.t())}
  def of_rna(rna) do
    translations = rna
                   |> String.split("", trim: true)
                   |> Stream.chunk_every(3)
                   |> Enum.map(fn chunk -> of_codon(Enum.join(chunk)) end)

    case Enum.all?(translations, fn {x, _} -> x == :ok end) do
      false -> {:error, "invalid RNA"}
      true  ->
        {:ok, translations
        |> Stream.map(fn {_, protein} -> protein end)
        |> Enum.take_while(fn protein -> protein != "STOP" end)}
    end
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: {atom, String.t()}
  def of_codon(codon) do
    case @translation[codon] do
      nil     -> {:error, "invalid codon"}
      protein -> {:ok, protein}
    end
  end
end
