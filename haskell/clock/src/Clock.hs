module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock {
  minutes :: Int
} deriving Eq

fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock ms
  where totalMinutes = hour * 60 + min
        ms | totalMinutes >= 0  = totalMinutes `rem` 1440
           | otherwise          = 1440 + rem totalMinutes 1440

toString :: Clock -> String
toString clock = mconcat [timeToString $ minutes clock `quot` 60, ":",
                          timeToString $ minutes clock `rem` 60]

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock = fromHourMin hour (minutes clock + min)

timeToString :: Int -> String
timeToString n | n < 10     = mconcat ["0", show n]
               | otherwise  = show n
