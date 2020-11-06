module DNA (toRNA) where

import Data.Either  (partitionEithers)

toRNA :: String -> Either Char String
toRNA xs = if length lefts > 0
           then Left $ head lefts
           else Right rights
  where (lefts, rights) = partitionEithers [d2r x | x <- xs]

d2r :: Char -> Either Char Char
d2r 'G' = Right 'C'
d2r 'C' = Right 'G'
d2r 'T' = Right 'A'
d2r 'A' = Right 'U'
d2r c   = Left c
