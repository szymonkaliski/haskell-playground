module Learn where

-- http://learnyouahaskell.com/for-a-few-monads-more (Error error on the wall) .. http://learnyouahaskell.com/zippers

-- `Error` is `Monad (Either e)`, where `Left` is error, `Right` is result
-- `Left 10 >>= \x -> return (x * 2)` -> `Left 10`
-- `Right 10 >>= \x -> Left "error..."` -> `Left "error.."`

-- `filterM` is like `filter` but for monads
-- `foldM` is like `foldl` but for monads
