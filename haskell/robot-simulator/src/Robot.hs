module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show)

data Robot = Robot {
  bearing     :: Bearing,
  coordinates :: (Integer, Integer)
} deriving Show

mkRobot :: Bearing -> (Integer, Integer) -> Robot
mkRobot = Robot

move :: Robot -> String -> Robot
move robot []     = robot
move robot (x:xs) = flip move xs $ act robot x

act :: Robot -> Char -> Robot
act (Robot facing coords) 'R'
  | facing == North = Robot East  coords
  | facing == East  = Robot South coords
  | facing == South = Robot West  coords
  | facing == West  = Robot North coords
act (Robot facing coords) 'L'
  | facing == North = Robot West  coords
  | facing == East  = Robot North coords
  | facing == South = Robot East  coords
  | facing == West  = Robot South coords
act (Robot facing (x, y)) _
  | facing == North = Robot North (x, y + 1)
  | facing == East  = Robot East  (x + 1, y)
  | facing == South = Robot South (x, y - 1)
  | facing == West  = Robot West  (x - 1, y)
