module Luhn (isValid) where

import Data.Char    (digitToInt, isNumber, isSpace)
import Data.List    (partition)

isValid :: String -> Bool
isValid n = length ns > 1 && digitsOnly && total `rem` 10 == 0
  where digitsOnly    = all (\c -> isNumber c || isSpace c) n
        ns            = map digitToInt $ filter isNumber n
        (secs, fsts)  = partitionEveryOther ns
        total         = sum fsts + (sum $ map luhnDouble secs)

isEven :: Int -> Bool
isEven n = n `rem` 2 == 0

partitionEveryOther :: [Int] -> ([Int], [Int])
partitionEveryOther ns = (map snd ys, map snd xs)
  where (xs, ys) = partition (\(i, _) -> isEven i) $ zip [0..] $ reverse ns

luhnDouble :: Int -> Int
luhnDouble n = if result > 9
               then result - 9
               else result
  where result = n * 2
