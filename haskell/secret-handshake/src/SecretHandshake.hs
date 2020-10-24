module SecretHandshake (handshake) where

import Data.Bits ((.&.), shift)

handshake :: Int -> [String]
handshake n = steps
  where xs = map (\f -> f n) [wink, doubleBlink, closeEyes, jump]
        xs' = filter (not . null) xs
        steps | rev n == "" = xs'
              | otherwise   = reverse xs'

wink :: Int -> String
wink = action "wink" 0

doubleBlink :: Int -> String
doubleBlink = action "double blink" 1

closeEyes :: Int -> String
closeEyes = action "close your eyes" 2

jump :: Int -> String
jump = action "jump" 3

rev :: Int -> String
rev = action "rev" 4

action :: String -> Int -> Int -> String
action xs bitShift n = result
  where b = 1 `shift` bitShift
        result | b .&. n > 0 = xs
               | otherwise   = ""
