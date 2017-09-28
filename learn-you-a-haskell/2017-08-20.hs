module Learn where

-- http://learnyouahaskell.com/functors-applicative-functors-and-monoids .. http://learnyouahaskell.com/functors-applicative-functors-and-monoids (Applicative functors)

-- functors - things that can be mapped over: lists, Maybe, etc...
-- `Functor` has only one typeclass method: `fmap`

-- `IO` is functor as well!
-- so `do line <- reverese getLine` won't work, but `do line <- fmap reverse getLine` does

-- functions are functors: `(->) r` is a functor (can be written as `r (->) a`
-- so it's `(->) r a`, and since type constructor has to take only one
-- parameter to be a functor, then `(->) r` it is)
--
-- mapping over function has to produce a function, so function functor is `.`:
--
-- ```
-- instance Functor ((->) r) where
--   fmap = (.)
-- ```
--
-- `fmap (* 2) (+ 10) 10` == `((* 2) . (+ 10)) 10`

-- functor laws:
-- * mapping `id` over functor should return `id`: `fmap id _SOMETHING_ = id _SOMETHING_`

