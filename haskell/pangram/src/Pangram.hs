module Pangram (isPangram) where

import Data.Char  (isAsciiLower, toLower)
import Data.List  (intersect)

isPangram :: String -> Bool
isPangram text = length cs == 26
  where letters = filter isAsciiLower $ map toLower text
        cs      = alphabet `intersect` letters

alphabet :: [Char]
alphabet = ['a' .. 'z']
