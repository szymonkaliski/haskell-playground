module Learn where

-- http://learnyouahaskell.com/syntax-in-functions (Guards, guards!) .. http://learnyouahaskell.com/recursion

fizzBuzz :: (Integral a, Show a) => a -> String
fizzBuzz num
  | mod num 3 == 0 && mod num 5 == 0 = "FizzBuzz"
  | mod num 3 == 0 = "Fizz"
  | mod num 5 == 0 = "Buzz"
  | otherwise = show num

-- [fizzBuzz x | x <- [1..100]]

max' :: (Ord a) => a -> a -> a
max' a b
  | a > b = a
  | otherwise = b


initials :: String -> String -> String
initials firstName lastName = [f] ++ ". " ++ [l] ++ "."
  where (f:_) = firstName
        (l:_) = lastName

-- `let`s work everywhere:
--
-- 1 + (let a = 10 in a * 2)
-- [let square x = x * x in (square 5, square 3, square 2)]


-- case:
-- case expr of pattern -> res
--              pattern -> res
--              ...

describeList :: [a] -> String
describeList xs = "The list is " ++ case xs of
                                         [] -> "empty"
                                         [x] -> "a singleton list"
                                         xs -> "a longer list"



