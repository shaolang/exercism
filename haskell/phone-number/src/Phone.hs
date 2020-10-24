module Phone (number) where

import Data.Char  (isNumber)

number :: String -> Maybe String
number xs = if validNumber
            then Just ys'
            else Nothing
  where ys = filter isNumber xs
        ys' | head ys == '1' && length ys == 11 = tail ys
            | otherwise                         = ys
        validNumber = length ys' == 10 && validArea ys' && validExchange ys'

validCode :: Int -> String -> Bool
validCode n xs = (head $ drop n xs) `notElem` "01"

validArea :: String -> Bool
validArea = validCode 0

validExchange :: String -> Bool
validExchange = validCode 3
