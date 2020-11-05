module DNA (toRNA) where

import Data.Maybe   (catMaybes)

toRNA :: String -> Either Char String
toRNA xs
  | unknowns /= []  = Left $ head unknowns
  | otherwise       = Right $ catMaybes [lookup x d2r | x <- xs]
  where unknowns = [ x | x <- xs, x `notElem` "GCTA"]

d2r :: [(Char, Char)]
d2r = [('G', 'C'), ('C', 'G'), ('T', 'A'), ('A', 'U')]
