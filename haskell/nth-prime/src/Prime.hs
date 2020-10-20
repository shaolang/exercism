module Prime (nth) where

nth :: Int -> Maybe Integer
nth 0 = Nothing
nth n = Just result
  where result = nth' (n - 1) 3 [2]

nth' :: Int -> Integer -> [Integer] -> Integer
nth' 0 _ (p:_)  = p
nth' n x primes
  | any (\y -> x `rem` y == 0) primes = nth' n       (x + 2) primes
  | otherwise                         = nth' (n - 1) (x + 2) (x:primes)
