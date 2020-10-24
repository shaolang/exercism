module SecretHandshake (handshake) where

import Data.Bits (testBit)

actions :: [String]
actions = ["wink", "double blink", "close your eyes", "jump"]

handshake :: Int -> [String]
handshake n = steps
  where xs = zip actions [testBit n x | x <- [0 .. 3::Int]]
        xs' = map fst $ filter snd xs
        steps | testBit n 4 = reverse xs'
              | otherwise   = xs'
