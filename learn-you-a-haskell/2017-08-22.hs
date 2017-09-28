module Learn where

-- http://learnyouahaskell.com/functors-applicative-functors-and-monoids (The newtype keyword) .. http://learnyouahaskell.com/a-fistful-of-monads

-- `newtype` generates new types from existing ones, is faster than `data` but restricted to just one constructor field

-- `type` / `newtype` / `data`:
--
-- `type` - makes type synonyms - another name to existing type
-- `type ListOfInts = [Int]` - `ListOfInts` can be used interchangeably with `[Int]`
--
-- `newtype` - wraps existing types in new types, so they can be made (easier) into instances of certain type classes
-- `newtype ListOfChars = ListOfChars { getListOfChars :: [Char] }`
-- ^ `++` can't be used on `ListOfChars` with `[Char]` or even on two `ListOfChars`, although `[Char]` can be unwrapped,
-- `++` applied, and wrapped back into `ListOfChars`; when creating `newtype` we get function for wrapping and unwrapping for free
--
-- `data` - for making brand new types

-- "associativity" -> `3 * 2 * 1` == `(3 * 2) * 1` == `3 * (2 * 1)` -- same for `++,` `+` but not `-`
-- monoid -> associative binary function, and value which acts as identity to that function:
-- `1` is identity for `*`, `[]` is identity for `++`, `0` is identity for `+`
--
-- ```
-- class Monoid m where
--   mempty :: m
--   mappend :: m -> m -> m
--   mconcat :: [m] -> m
--   mconcat = foldr mappend mempty
-- ```
--
-- `mempty` - it's a constant and represents identity value for given monoid
-- `mappend` - takes two values of the same type, and returns the same value (like `++`, `*`, etc...)
-- `mconcat` - takes lists of values and reduces them to single value

-- lists are monoids:
-- ```
-- instance Monoid [a] where
--   mempty = []
--   mappend = (++)
-- ```

