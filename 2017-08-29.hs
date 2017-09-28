module Learn where

-- http://learnyouahaskell.com/zippers (Watch your step)

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

-- ^ binary Tree

testTree :: Tree Char
testTree =
  Node 'A'
    (Node 'B' Empty Empty)
    (Node 'C' Empty Empty)

data Crumb a = LeftCrumb a (Tree a) | RightCrumb a (Tree a) deriving (Show)
type Breadcrumbs a = [Crumb a]
type Zipper a = (Tree a, Breadcrumbs a)

goLeft :: Zipper a -> Maybe (Zipper a)
goLeft (Node x l r, bs) = Just (l, LeftCrumb x r:bs)
goLeft (Empty, _) = Nothing

goRight :: Zipper a -> Maybe (Zipper a)
goRight (Node x l r, bs) = Just (r, RightCrumb x l:bs)
goRight (Empty, _) = Nothing

goUp :: Zipper a -> Maybe (Zipper a)
goUp (t, LeftCrumb x r:bs) = Just (Node x t r, bs)
goUp (t, RightCrumb x l:bs) = Just (Node x l t, bs)
goUp (_, []) = Nothing

-- `return (testTree , []) >>= goRight >>= goRight` -> `Just (Empty,[RightCrumb 'C' Empty,RightCrumb 'A' (Node 'B' Empty Empty)])`

