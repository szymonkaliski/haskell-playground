module Learn where

-- http://learnyouahaskell.com/a-fistful-of-monads .. http://learnyouahaskell.com/a-fistful-of-monads (The list monad)

-- monads are one step more from applicative functors, which are one step more from functors
-- applicative value is value with added context (`1` vs `[1]`/`Just 1`)

-- `Maybe` is a monad
-- `>>=` (bind) - takes monadic value, nad function that works on normal value, and returns mondaic value with the function applied
-- `Just 10 >>= return . (* 10)` -> `Just 100` -- notice the `return`!
-- `Nothing >>= return . (* 10)` -> `Nothing`

-- `do` is construct in every monad, not only IO:
-- ```
-- justH :: Maybe Char
-- justH = do
--     (x:_) <- Just "hello"
--     return x
-- ```
-- ^ pattern match on first character from `Just "hello"`, and return it (as `Just 'h'`, since we're in `do` block)
