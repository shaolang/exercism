module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

earthSecondsPerYear :: Float
earthSecondsPerYear = 31557600

ageOn :: Planet -> Float -> Float
ageOn Mercury seconds = seconds / (earthSecondsPerYear * 0.2408467)
ageOn Venus   seconds = seconds / (earthSecondsPerYear * 0.61519726)
ageOn Earth   seconds = seconds / earthSecondsPerYear
ageOn Mars    seconds = seconds / (earthSecondsPerYear * 1.8808158)
ageOn Jupiter seconds = seconds / (earthSecondsPerYear * 11.862615)
ageOn Saturn  seconds = seconds / (earthSecondsPerYear * 29.447498)
ageOn Uranus  seconds = seconds / (earthSecondsPerYear * 84.016846)
ageOn Neptune seconds = seconds / (earthSecondsPerYear * 164.79132)
