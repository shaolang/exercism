module TwelveDays (recite) where

recite :: Int -> Int -> [String]
recite start stop = map verse [start .. stop]

verse :: Int -> String
verse n = mconcat [opening, itemList, "."]
  where opening = mconcat ["On the ", days !! (n - 1), " day of Christmas my true love gave to me:"]
        itemList | n == 1    = last items
                 | otherwise = mconcat $ (take (n - 1) $ drop (12 - n) items) ++ [" and", last items]

days :: [String]
days = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh",
        "eighth", "ninth", "tenth", "eleventh", "twelfth"]

items :: [String]
items = [
  " twelve Drummers Drumming,",
  " eleven Pipers Piping,",
  " ten Lords-a-Leaping,",
  " nine Ladies Dancing,",
  " eight Maids-a-Milking,",
  " seven Swans-a-Swimming,",
  " six Geese-a-Laying,",
  " five Gold Rings,",
  " four Calling Birds,",
  " three French Hens,",
  " two Turtle Doves,",
  " a Partridge in a Pear Tree"]
