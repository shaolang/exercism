module Pangram (isPangram) where

import Data.Char  (isAsciiLower, toLower)
import Data.List  (group, sort)

isPangram :: String -> Bool
isPangram text = alphabet == map head cs
  where letters = filter isAsciiLower $ map toLower text
        cs      = group $ sort letters

alphabet :: [Char]
alphabet = ['a' .. 'z']
