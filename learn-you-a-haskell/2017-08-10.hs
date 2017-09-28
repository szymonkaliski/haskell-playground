module Learn where

-- http://learnyouahaskell.com/recursion .. http://learnyouahaskell.com/higher-order-functions

maximum' :: (Ord a) => [a] -> a
maximum' [] = error "empty list"
maximum' [x] = x                 -- maximum of single item is this item
maximum' (x:xs)
  | x > currentMax = x           -- if x is more than currentMax then result is x
  | otherwise = currentMax       -- otherwise result is currentMax
  where currentMax = maximum' xs -- while currentMax is maximum of rest of tail of the array

-- another take at maximum:

maximum'' :: (Ord a) => [a] -> a
maximum'' [] = error "empty list"
maximum'' [x] = x
maximum'' (x:xs) = max x (maximum'' xs)


reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = (reverse' xs) ++ [x] -- reverse rest of the items, and add to current item



