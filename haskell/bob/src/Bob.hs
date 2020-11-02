module Bob (responseFor) where

import Data.Char (isAlpha, isSpace, isUpper)

responseFor :: String -> String
responseFor xs
  | xs' == ""                                       = "Fine. Be that way!"
  | upperCaseOnly && isQuestion = "Calm down, I know what I'm doing!"
  | isQuestion                  = "Sure."
  | upperCaseOnly                     = "Whoa, chill out!"
  | otherwise                                       = "Whatever."
  where xs' = filter (not . isSpace) xs
        xss = filter isAlpha xs
        isQuestion    = last xs' == '?'
        upperCaseOnly = all isUpper xss && xss /= ""
