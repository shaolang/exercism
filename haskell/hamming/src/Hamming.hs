module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys
  | length xs /= length ys = Nothing
  | otherwise = Just $ length $ filter (\(a, b) -> a /= b) $ zip xs ys
