defmodule TwelveDays do
  @day_gifts [
    {"first",   "a Partridge in a Pear Tree"},
    {"second",  "two Turtle Doves"},
    {"third",   "three French Hens"},
    {"fourth",  "four Calling Birds"},
    {"fifth",   "five Gold Rings"},
    {"sixth",   "six Geese-a-Laying"},
    {"seventh", "seven Swans-a-Swimming"},
    {"eighth",  "eight Maids-a-Milking"},
    {"ninth",   "nine Ladies Dancing"},
    {"tenth",   "ten Lords-a-Leaping"},
    {"eleventh","eleven Pipers Piping"},
    {"twelfth", "twelve Drummers Drumming"}]

  @doc """
  Given a `number`, return the song's verse for that specific day, including
  all gifts for previous days in the same line.
  """
  @spec verse(number :: integer) :: String.t()
  def verse(number) do
    gifts = @day_gifts
    |> Stream.take(number)
    |> Stream.map(&(elem &1, 1))
    |> Enum.reverse
    |> Enum.join(", ")
    |> String.replace(~r{(, a Partridge)}, ", and a Partridge")

    {day, _} = Enum.fetch!(@day_gifts, number - 1)

    "On the #{day} day of Christmas my true love gave to me: #{gifts}."
  end

  @doc """
  Given a `starting_verse` and an `ending_verse`, return the verses for each
  included day, one per line.
  """
  @spec verses(starting_verse :: integer, ending_verse :: integer) :: String.t()
  def verses(starting_verse, ending_verse) do
    starting_verse..ending_verse
    |> Enum.map_join("\n", &verse/1)
  end

  @doc """
  Sing all 12 verses, in order, one verse per line.
  """
  @spec sing() :: String.t()
  def sing do
    verses(1, 12)
  end
end
