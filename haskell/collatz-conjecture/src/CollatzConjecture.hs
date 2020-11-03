module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0    = Nothing
  | otherwise = Just $ col n 0
  where col 1 steps = steps
        col m steps = col m' $ steps + 1
          where m' = if even m
                     then m `div` 2
                     else 3 * m + 1
