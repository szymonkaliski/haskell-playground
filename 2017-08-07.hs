
module Learn where

-- http://learnyouahaskell.com/types-and-typeclasses .. http://learnyouahaskell.com/syntax-in-functions (Guards, guards!)

-- :t something -> type of something

-- is a function that transforms string to string
removeNonUppercase :: String -> String
removeNonUppercase st = [ c | c <- st, elem c ['A'..'Z']]

-- takes thre ints and returns an int
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- :t head
-- head :: [a] -> a
-- `a` is type variable

-- show x -> string of x
-- show 3 -> "3"
-- show True -> "True"
--
-- read x -> reverse of show x...


-- pattern matching - "Integral" is a type class
lucky :: (Integral a) => a -> String
lucky 7 = "LUCKY!"
lucky _ = "No luck"

-- recursive factorial
factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- pattern matching vectors
addVec :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVec (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- custom head
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

-- custom length
length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + (length' xs)

