module CryptoSquare (encode) where

import Data.Char    (isLetter, isNumber, toLower)
import Data.List    (intercalate, transpose)

type Column = Int
type Row    = Int
type Length = Int

encode :: String -> String
encode "" = ""
encode xs = intercalate " " xss'
  where xs'           = map toLower $ filter isLetterOrNumber xs
        (_, column)   = dimension (length xs) 0 1
        xss'          = transpose $ chunk column xs'

isLetterOrNumber :: Char -> Bool
isLetterOrNumber c = isLetter c || isNumber c

dimension :: Length -> Row -> Column -> (Row, Column)
dimension l r c | r * c >= l = (r, c)
                | c == r     = dimension l (c + 1) r
                | otherwise  = dimension l c (r + 1)

chunk :: Int -> String -> [String]
chunk _ [] = []
chunk n s  = xs : chunk n ys
  where (xs, ys) = splitAt n s
