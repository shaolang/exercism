defmodule Matrix do
  defstruct matrix: []

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input) do
    m = input
        |> String.split("\n")
        |> Stream.map(&(String.split(&1, " ", trim: true)))
        |> Enum.map(fn ss -> ss |> Enum.map(&String.to_integer/1) end)

    %__MODULE__{matrix: m}
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix) do
    matrix.matrix
    |> Enum.map_join("\n", fn row ->
      row
      |> Stream.map(&Integer.to_string/1)
      |> Enum.join(" ")
    end)
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(matrix) do
    matrix.matrix
  end

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index) do
    Enum.fetch!(matrix.matrix, index)
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix) do
    0..(Enum.count(row(matrix, 0)) - 1)
    |> Enum.map(&(column(matrix, &1)))
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index) do
    matrix.matrix
    |> Enum.map(&(Enum.fetch!(&1, index)))
  end
end
