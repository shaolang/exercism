module Bob (responseFor) where

import Data.Char (isAlpha, isSpace, isUpper)

responseFor :: String -> String
responseFor xs
  | xs' == ""                                       = "Fine. Be that way!"
  | xss /= "" && all isUpper xss && last xs' == '?' = "Calm down, I know what I'm doing!"
  | last xs' == '?'                                 = "Sure."
  | all isUpper xss && xss /= ""                    = "Whoa, chill out!"
  | otherwise                                       = "Whatever."
  where xs' = filter (not . isSpace) xs
        xss = filter isAlpha xs
