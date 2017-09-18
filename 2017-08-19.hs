import System.Environment
import System.Random
import System.IO
import System.IO.Error
import Control.Exception

-- http://learnyouahaskell.com/input-and-output (Command line arguments) .. http://learnyouahaskell.com/functionally-solving-problems

main1 = do
  args <- getArgs
  putStrLn $ unwords args

-- `runhaskell ./2017-08-19.hs a b c` -> `a b c`
-- there's also `getProgName`

main2 = do
  let (r, _) = random (mkStdGen 100) :: (Int, StdGen)
  putStrLn $ show r

-- `cabal install random`
-- `random (mkStdGen 100)` is not going to work, `random` needs to know which class to give back, so that's why there's type annotation
-- this will always return the same value, since we're using `mkStdGen 100` it's always random based on `100`

-- `randoms` returns infinite list of random values: `take 10 $ randoms (mkStdGen 100) :: [Int]`
-- `randomR` returns random between two values: `randomR (1, 10) (mkStdGen 100)`

main3 = do
  gen <- getStdGen
  putStrLn $ take 20 (randomRs ('a','z') gen)

-- ^ random string generator

main4 = catch toTry handler

toTry :: IO ()
toTry = do
  args <- getArgs
  let fileName = head args
  contents <- readFile fileName
  putStrLn $ "Lines #: " ++ show (length (lines contents))

handler :: IOError -> IO ()
handler e
  | isDoesNotExistError e = putStrLn "File doesn't exist"
  | otherwise = ioError e

-- ^ try/catch in HS

main = main4
