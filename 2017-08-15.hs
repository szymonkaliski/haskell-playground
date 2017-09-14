module Learn where

-- http://learnyouahaskell.com/making-our-own-types-and-typeclasses .. http://learnyouahaskell.com/making-our-own-types-and-typeclasses (Type Parameteres)

-- defininig a type: `data TYPENAME = VAL1 | VAL2 ...`

-- data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving Show

-- Shape can be a Circle (with 3 floats) or Rectangle (with 4 floats)
-- `:t Circle` -> `Circle :: Float -> Float -> Float -> Shape`

-- surface :: Shape -> Float
-- surface (Circle _ _ r) = pi * r ^ 2
-- surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- pattern matching on type ^
-- `surface $ Circle 10 10 10` -> `314.15927`

-- `Circle` is not a type, `Shape` is! `Circle` is just a constructor
-- `Circle` is a function: `map (Circle 10 10) [4,5,6]`

data Point = Point Float Float deriving Show
data Shape = Circle Point Float | Rectangle Point Point deriving Show

surface :: Shape -> Float
surface (Circle _ r) = pi * r ^ 2
surface (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- pattern matching on types again ^

-- nudge - move shape by point
nudge :: Shape -> Point -> Shape
nudge (Circle (Point x y) r) (Point a b) = Circle (Point (x + a) (y + b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) (Point a b) = Rectangle (Point (x1 + a) (y1 + b)) (Point (x2 + a) (y2 + b))

-- records

data Person = Person { firstName :: String
                     , lastName :: String
                     , age :: Int
                     } deriving (Show)

-- haskell automatically generates getters from records! so `firstName` is a function

-- create a person:
-- `me = Person { firstName = "Szymon", lastName = "Kaliski", age = 28 }`
-- `firstName me`
-- `lastName me`
-- `age me`
