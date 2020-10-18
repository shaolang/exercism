module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard p xs = keep (not . p) xs

keep :: (a -> Bool) -> [a] -> [a]
keep _ []     = []
keep p (x:xs) = if p x
                then x:keep p xs
                else keep p xs
