module Learn where

-- http://learnyouahaskell.com/making-our-own-types-and-typeclasses (Type Parameteres) .. http://learnyouahaskell.com/making-our-own-types-and-typeclasses (Type Synonyms)

-- type parameters
-- `data Maybe a = Nothing | Just a` - `a` here is a parameter, `Maybe` is a "type constructor"
-- `:t Just 12` -> `Just 12 :: Num a => Maybe a`

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
         deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- `Monday == Monday` -> `True` because of `Eq`
-- `Monday < Tuesday` -> `True` because of `Ord`
-- `read "Monday" == Monday` -> `True` because of `Read`
-- `minBound Day == Monday` -> `True` because of `Bounded`
-- `[Monday..Friday]` -> `[...]` because of `Enum`

