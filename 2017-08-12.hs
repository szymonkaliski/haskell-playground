module Learn where

-- http://learnyouahaskell.com/higher-order-functions (Function application with $) .. http://learnyouahaskell.com/modules

-- $ makes things on the right to be calculated first:
-- sqrt 3 + 4 + 9 would first sqrt 3 and then add 4 and 9 to it
-- sqrt (3 + 4 + 9) is the same as sqrt $ 3 + 4 + 9

-- things like this also work:
-- filter (> 10) $ map (* 2) [1..10]
-- takeWhile (< 20) $ filter (> 10) $ map (* 2) [1..] -- takeWhile and not filter, as filter never ends on infinite arrays

-- . is functional composition -> (f . g) x == f(g x)
-- negate . (* 3) is a function that multiplies by 3 and then negates
