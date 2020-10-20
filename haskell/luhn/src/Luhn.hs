module Luhn (isValid) where

import Data.Char    (digitToInt, isNumber, isSpace)

isValid :: String -> Bool
isValid n = length ns > 1 && digitsOnly && total `rem` 10 == 0
  where digitsOnly  = all (\c -> isNumber c || isSpace c) n
        ns          = map digitToInt $ filter isNumber n
        nss         = zipWith (*) (cycle [1, 2]) (reverse ns)
        total       = sum $ map capAtNine nss

capAtNine :: Int -> Int
capAtNine n | n > 9     = n - 9
            | otherwise = n
