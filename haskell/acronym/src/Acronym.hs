module Acronym (abbreviate) where

import Data.Char  (isLetter, isLower, isSeparator, isUpper, toUpper)

abbreviate :: String -> String
abbreviate xs = map (\(c:_) -> toUpper c) $ words xs'
  where xs' = split_camelcase $ filter (\c -> isLetter c || isSeparator c) $ replace_dashes xs

replace_dashes :: String -> String
replace_dashes [] = []
replace_dashes ('-':cs) = ' ':replace_dashes cs
replace_dashes (c:cs) = c:replace_dashes cs

split_camelcase :: String -> String
split_camelcase (x:y:z:cs) = if isLower x && isUpper y && isLower z
                             then x:' ':(split_camelcase $ y:z:cs)
                             else x:(split_camelcase $ y:z:cs)
split_camelcase cs = cs
