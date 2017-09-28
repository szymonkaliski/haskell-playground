module Learn where

-- http://learnyouahaskell.com/making-our-own-types-and-typeclasses (Type Synonyms) .. http://learnyouahaskell.com/input-and-output

-- `type String = [Char]` - String is alias to array of Chars
--
-- if we have type `type Phonebook = [(String, String)]` we can make aliases so types are more informative:
-- `type PhoneNumber = String`
-- `type Name = String`
-- and then we have: `type Phonebook = [(Name, PhoneNumber)]`

-- `data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)`  
-- `:t Left 'A'` -> `Either Char b`
-- `:t Right 'B'` -> `Either a Char`
-- `Either` can be used for error handling -> `Left` is always error, `Right` is always value

-- `Functor` typeclass:
-- ```
-- class Functor f where
--   fmap :: (a ->b ) -> f a -> f b
-- ```
-- `Functor` is type constructor that takes one parameter - `f` (same as `Maybe`)
--
-- `map` is a functor that only works on arrays, parameter `f` is `[]`!
-- ```
-- instance Functor [] where
--   fmap = map
-- ```
--
-- `fmap (* 2) [1..10]` == `map (* 2) [1..10]`
--
-- `Maybe` is a functor as well:
-- ```
-- instance Functor Maybe where
--   fmap f (Just x) = Just (f x)
--   fmap f Nothing = Nothing
-- ```
--
-- ^ this means, safe null-values handling!
--
-- ```
-- > fmap (* 2) $ Just 2
-- Just 4
-- > fmap (* 2) $ Nothing
-- Nothing
-- ```
