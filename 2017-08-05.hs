module Learn where

-- http://learnyouahaskell.com/starting-out#ready-set-go .. http://learnyouahaskell.com/starting-out#im-a-list-comprehension
--
-- ghci
-- > :l 2017-08-05.hs
-- > :r -- reload
--

doubleMe x = x * 2

-- doubleMe 2
-- doubleMe 2.5

doubleUs x y = x * 2 + y * 2

doubleSmall x = if x > 100 then x else x * 2

numbersList = [2, 3, 4, 5]

-- numbersList ++ [6] - works
-- numbersList ++ ['6'] - doesn't works
-- 5: numbersList - cons, faster than concat
-- numbersList !! 2 - get third element (4)

helloWorld = "Hello " ++ "World" -- strings are lists

-- comparing lists works as you expect:
-- [3] > [2]
-- [3, 3] > [3, 2]
-- [3, 3, 3] > [3, 3]

firstNumber = head numbersList
restOfNumbers = tail numbersList
lastNumber = last numbersList
butLastNumber = init numbersList

numberOfItems = length numbersList

-- null [] -> True
-- reverse [2, 3] -> [3, 2]
-- take 2 [2, 3, 4, 5] -> [2, 3]
-- drop 2 [2, 3, 4, 5] -> [4, 5]
--
-- maximum [1, 2, 3] -> 3
-- minimum [1, 2, 3] -> 1
-- sum [1, 2, 3] -> 6
-- elem 1 [1, 2, 3] -> True
-- elem 18 [1, 2, 3] -> False
--
-- [1..10] -> [1, 2, ... 10]
-- [10..1] -> nope
-- [10,9..1] -> works
-- ['a'..'z'], ['K'..'Q'], ...
--
-- cycle [1,2,3] - infinite, lazy -> take 10 (cycle [1,2,3])
-- repeat "a"
