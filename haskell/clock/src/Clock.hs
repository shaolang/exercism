module Clock (addDelta, fromHourMin, toString) where

import Text.Printf    (printf)

data Clock = Clock Int deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock ms
  where totalMinutes = hour * 60 + min
        ms | totalMinutes >= 0  = totalMinutes `rem` 1440
           | otherwise          = 1440 + rem totalMinutes 1440

toString :: Clock -> String
toString (Clock minutes) = printf "%02d:%02d" h m
  where (h, m) = minutes `divMod` 60

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min (Clock minutes) = fromHourMin hour (minutes + min)
