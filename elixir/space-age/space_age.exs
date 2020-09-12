defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus
  @seconds_on_earth 31557600
  @seconds_by_planet %{mercury: @seconds_on_earth * 0.2408467,
                       venus: @seconds_on_earth * 0.61519726,
                       earth: @seconds_on_earth,
                       mars: @seconds_on_earth * 1.8808158,
                       jupiter: @seconds_on_earth * 11.862615,
                       saturn: @seconds_on_earth * 29.447498,
                       neptune: @seconds_on_earth * 164.79132,
                       uranus: @seconds_on_earth * 84.016846}

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / @seconds_by_planet[planet]
  end
end
