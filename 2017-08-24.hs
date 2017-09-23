module Learn where

-- http://learnyouahaskell.com/a-fistful-of-monads (The list monad) .. http://learnyouahaskell.com/for-a-few-monads-more

-- lists can use bind:
-- `[2,3,4] >>= \x -> [x * 2]` -> `[4,6,8]`
-- `[2,3,4] >>= \x -> [x * 2, x]` -> `[4,2,6,3,8,4]`
-- `[] >>= \x -> [x * 2, x]` -> `[]`

-- monad laws:
-- left identity - `return x >>= f` == `f x`
-- right identity - `m >>= return` == `m`
-- associativity - `(m >>= f) >>= g` == `m >>= (\x -> f x >>= g)`

