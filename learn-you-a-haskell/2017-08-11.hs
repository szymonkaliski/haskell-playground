module Learn where

-- http://learnyouahaskell.com/higher-order-functions .. http://learnyouahaskell.com/higher-order-functions (Function application with $)

-- everything is curried: ((max 4) 5) == (max 4 5)
--
-- 200 / 10 = (/10) 200 -- (/10) is called "section"
-- so:

divideByTen :: (Floating a) => a -> a
divideByTen = (/10) -- (/10) is partialy applied

applyTwice :: (a -> a) -> a -> a -- (a -> a) in parens implies that arg is a function
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c] -- takes function with two params (a & b), returns new array from two arrays
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys -- concat function ran on heads, with recursive zipWith' on tails

-- zipWith' (+) [1, 2] [3, 4]

flip' :: (a -> b -> c) -> (b -> a -> c) -- flip function arguments
flip' f x y = f y x

-- foldl is like a reduce:

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\ acc x -> acc + x) 0 xs -- (\ is lambda, acc & x are two args, and we add them, 0 is first value in acc
-- sum' xs = foldl (+) 0 xs -- same as above, but without lambda
-- sum' = foldl (+) 0 -- same as above, but without lambda and no need for xs since everything is partially applied

-- foldr is like foldl but from other side:

map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\ x acc -> f x : acc) [] xs -- since it's from right, acc and x are reversed

-- map' could be done with foldl and ++ but ++ is more expensive than :
--
-- foldl1 and foldr1 don't need starting argument - asume first (or last) is first acc!
-- scanl, scanr, scanl1, scanr1 are like foldl, foldr, ... but return intermediate values in an array
--
-- scanl (+) 0 [1,2,3] -> [0,1,3,6]


