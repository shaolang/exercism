module DND ( Character(..)
           , ability
           , modifier
           , character
           ) where

import Test.QuickCheck  (Arbitrary, arbitrary, Gen)
import Test.QuickCheck.Gen (choose)

data Character = Character
  { strength     :: Int
  , dexterity    :: Int
  , constitution :: Int
  , intelligence :: Int
  , wisdom       :: Int
  , charisma     :: Int
  , hitpoints    :: Int
  }
  deriving (Show, Eq)

instance Arbitrary Character where
  arbitrary = do
    str' <- ability
    dex' <- ability
    con' <- ability
    int' <- ability
    wis' <- ability
    cha' <- ability
    let hit' = 10 + modifier con'
    return $ Character str' dex' con' int' wis' cha' hit'

modifier :: Int -> Int
modifier n = (n - 10) `div` 2

ability :: Gen Int
ability = choose (3, 18)


character :: Gen Character
character = arbitrary
