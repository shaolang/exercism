module Anagram (anagramsFor) where

import Data.Char  (toLower)
import Data.List  (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor xs xss = anagrams
  where xs' = map toLower xs
        candidates = filter (\s -> map toLower s /= xs') xss
        sortedXs = sort xs'
        anagrams = filter (\s ->  sortedXs == (sort $ map toLower s)) candidates
