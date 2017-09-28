module Learn where

import Control.Monad.Writer
import Control.Monad.State
import System.Random

-- http://learnyouahaskell.com/for-a-few-monads-more ..  http://learnyouahaskell.com/for-a-few-monads-more (Error error on the wall)

-- `ghc-pkg list` to get list of installed packages
-- `cabal install X` to install X

-- `Writer` monad is used for storing logs while doing computations

logNumber :: Int -> Writer [String] Int
logNumber x = writer (x, ["got: " ++ show x])

multWithLog :: Writer [String] Int
multWithLog = do
  a <- logNumber 3
  b <- logNumber 5
  tell ["multiplying..."]
  return (a * b)

-- ^ `multWithLog` -> `WriterT (Identity (15,["got: 3","got: 5","multiplying..."]))`
-- `tell` is a function from `Writer` to add additional log

-- `State` monad wraps stateful computations

type Stack = [Int]

pop :: State Stack Int
pop = state $ \(x:xs) -> (x, xs)

push :: Int -> State Stack ()
push a = state $ \xs -> ((), a:xs)

stackManip :: State Stack Int
stackManip = do
  push 10
  push 20
  pop

-- `runState stackManip [1, 2, 3]` -> `(20,[10,1,2,3])`

randomState :: (RandomGen g, Random a) => State g a
randomState = state random

threeCoins :: State StdGen (Bool,Bool,Bool)
threeCoins = do
  a <- randomState
  b <- randomState
  c <- randomState
  return (a,b,c)

-- `runState threeCoins (mkStdGen 100)` -> `((True,False,False),693699796 2103410263)`
