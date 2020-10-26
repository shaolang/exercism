module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show

label :: Resistor -> String
label resistor = mconcat [show n, s]
  where v = ohms resistor
        (n, s) | v >= 1000000000 = (div v 1000000000, " gigaohms")
               | v >= 1000000    = (div v 1000000,    " megaohms")
               | v >= 1000       = (div v 1000   ,    " kiloohms")
               | otherwise       = (v,                " ohms")

ohms :: Resistor -> Int
ohms resistor = (fromEnum x * 10 + fromEnum y) * (10 ^ fromEnum z)
  where (x, y, z) = bands resistor
