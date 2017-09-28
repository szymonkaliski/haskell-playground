import Data.Char
import Control.Monad
import System.IO

-- http://learnyouahaskell.com/input-and-output .. http://learnyouahaskell.com/input-and-output (Command line arguments)

main1 = putStrLn "HI!"

-- ^ bash: `ghc --make ./2017-08-18.hs && ./2017-08-18` -> "HI!"
--
-- `:t putStrLn` -> `String -> IO ()`
-- ^ takes a String, returns IO action with result type of empty tuple ()
-- IO is executed if we make it in `main` and execute the app
--
-- multiple actions are possible with `do`:

main2 = do
  putStrLn "Name?"
  name <- getLine
  let bigName = map toUpper name
  putStrLn $ "HI! " ++ bigName

-- `:t getLine` -> `IO String` - so IO action returning a String
--
-- `name <- getLine` means exucte `getLine` and bind result to `name`
-- `name = getLine` would bind getLine action to `name` - new name for `getLine`, not result of `getLine`
--
-- `<-` is used when binding IO actions, `let` to bind pure functions to names

main3 = do
  line <- getLine
  if null line
     then return ()
     else do
       putStrLn $ "> " ++ line
       main3

-- ^ recursively read and put line, ends when line is null (empty)
-- `return` is not like `return` in other languages - it basically transforms `something` into `IO something`
-- it doesn't stop the block execution so multiple returns are possible:
--
-- ```
-- main = do
--   a <- return "HI"
--   b <- return "ASD"
--   putStrLn $ a ++ b
-- ```

main4 = do
  char <- getChar
  when (char /= ' ') $ do
    putChar char
    main4

-- ^ `when` is from `Control.Monad`, takes a boole and and IO action, and returns the same IO action if boolean is True,
-- otherwise returns `return ()`

main5 = do
  results <- sequence [getLine, getLine]
  print results

-- ^ `sequence` takes a list of IO actions and performs them in order, binding results to array
-- here it will read line twice, and then return array of both reads

-- `mapM` and `mapM_` are like `sequence $ map ...`
-- `forM` is `mapM` with reversed args, first the array, then a function

-- `getContents` is lazy IO String that reads file until the end

main6 = do
  contents <- getContents
  putStr $ map toUpper contents

-- `interact` takes `String -> String` and returns IO action that will take some input, and print the output
-- it's used to build pipeline programs

isPalindrome :: String -> Bool
isPalindrome str = str == reverse str

respondPalindromes :: String -> String
respondPalindromes = unlines . map (\s -> if isPalindrome s then "palindrome" else "not a palindrome") . lines

main7 = interact respondPalindromes

-- files can be read with `openFile`

main8 = do
  handle <- openFile "2017-08-18.hs" ReadMode
  contents <- hGetContents handle
  putStr contents
  hClose handle

-- `withFile` is enapsulated `openFile` with `hClose`:

main9 = do
  withFile "2017-08-18.hs" ReadMode (\handle -> do
                                    contents <- hGetContents handle
                                    putStr contents)

-- `writeFile` writes to file: `writeFile fileName contents`
-- `appendFile` append to file: `appendFile fileName contents`

main = main9

