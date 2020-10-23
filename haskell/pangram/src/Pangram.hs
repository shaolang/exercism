module Pangram (isPangram) where

import Data.Char  (toLower)
import Data.List  ((\\))

isPangram :: String -> Bool
isPangram text = (alphabet \\ text') == ""
  where text' = map toLower text

alphabet :: [Char]
alphabet = ['a' .. 'z']
