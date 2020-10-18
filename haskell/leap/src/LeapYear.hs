module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = result
  where result = (year `rem` 4 == 0 && year `rem` 100 /= 0) || year `rem` 400 == 0
