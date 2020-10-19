module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year = divisbleBy4Not100
  where divisbleBy4Not100 = year `rem` 4 == 0 &&
                            (year `rem` 100 /= 0 || year `rem` 400 == 0)
