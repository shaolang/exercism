module Acronym (abbreviate) where

import Data.Char  (isLower, isUpper, toUpper)

abbreviate :: String -> String
abbreviate xs = map (toUpper . head) $ ws
  where ws = words $ replaceWithSpace xs

replaceWithSpace :: String -> String
replaceWithSpace [] = []
replaceWithSpace ('_':cs) = ' ':replaceWithSpace cs
replaceWithSpace ('-':cs) = ' ':replaceWithSpace cs
replaceWithSpace (x:y:z:cs) = if isLower x && isUpper y && isLower z
                              then x:' ':replaceWithSpace (y:z:cs)
                              else x:replaceWithSpace (y:z:cs)
replaceWithSpace (c:cs) = c:replaceWithSpace cs
