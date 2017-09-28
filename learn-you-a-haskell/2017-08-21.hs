module Learn where

import Control.Applicative

-- http://learnyouahaskell.com/functors-applicative-functors-and-monoids (Applicative functors) .. http://learnyouahaskell.com/functors-applicative-functors-and-monoids (The newtype keyword)

-- `<*>` for `Maybe` extracts the function from left value (if it's `Just`) and maps over right value,
-- if left or right are `Nothing`, `Nothing` is the result
--
-- `Just (+ 3) <*> Just 9` -> `Just 12`
-- `Just (+ 3) <*> Nothing` -> `Nothing`
-- `Just (+) <*> Just 1 <*> Just 2` -> `Just 3`
--
-- `<$>` is `fmap` as infix operator:
-- `(++) <$> Just "A" <*> Just "B"` -> `Just "AB"`
--
-- not only `Maybe` is applicative ^:
--
-- lists are as well:
-- `[(* 2), ((-) 3)] <*> [10, 1]` -> `[20,2,-7,2]` -- applying 10 with `* 2` and `- 3`, and 1 with `* 2` and `- 3`
--
-- `IO` is as well:
-- ```
-- main = do
--   concated <- (++) <$> getLine <*> getLine
--   putStrLn $ "Concated result: " ++ concated
-- ```
--
-- `liftA2` hides the syntax a bit: `liftA2 f a b = f <$> a <*> b`
-- `liftA2 (+) (Just 3) (Just 4)` -> `Just 7` (same as `(+) <$> (Just 3) <*> (Just 4)`)
