module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

classify :: Int -> Maybe Classification
classify n
  | n < 1          = Nothing
  | n == 1         = Just Deficient
  | aliquot n == n = Just Perfect
  | aliquot n >  n = Just Abundant
  | otherwise      = Just Deficient

aliquot :: Int -> Int
aliquot n = 1 + sum ns
  where ns = filter (\i -> n `rem` i == 0) [2 .. (n - 1)]
