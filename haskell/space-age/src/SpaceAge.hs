module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / divisor planet

earthSecondsPerYear :: Float
earthSecondsPerYear = 31557600

divisor :: Planet -> Float
divisor Mercury = earthSecondsPerYear * 0.2408467
divisor Venus   = earthSecondsPerYear * 0.61519726
divisor Earth   = earthSecondsPerYear
divisor Mars    = earthSecondsPerYear * 1.8808158
divisor Jupiter = earthSecondsPerYear * 11.862615
divisor Saturn  = earthSecondsPerYear * 29.447498
divisor Uranus  = earthSecondsPerYear * 84.016846
divisor Neptune = earthSecondsPerYear * 164.79132
