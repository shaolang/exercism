module LeapYear (isLeapYear) where

import Data.Bits

isLeapYear :: Integer -> Bool
isLeapYear year = isEven year && result
  where result = (year `rem` 4 == 0 && year `rem` 100 /= 0) || year `rem` 400 == 0

isEven :: Integer -> Bool
isEven n = (n .&. 1) == 0
