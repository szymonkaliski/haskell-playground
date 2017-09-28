module Learn where

-- http://learnyouahaskell.com/zippers (Manipulating trees under focus) .. http://learnyouahaskell.com/zippers (Watch your step)

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

-- ^ binary Tree

testTree :: Tree Char
testTree =
  Node 'A'
    (Node 'B' Empty Empty)
    (Node 'C' Empty Empty)

data Crumb a = LeftCrumb a (Tree a) | RightCrumb a (Tree a) deriving (Show)
type Breadcrumbs a = [Crumb a]

goLeft :: (Tree a, Breadcrumbs a) -> (Tree a, Breadcrumbs a)
goLeft (Node x l r, bs) = (l, LeftCrumb x r:bs)

goRight :: (Tree a, Breadcrumbs a) -> (Tree a, Breadcrumbs a)
goRight (Node x l r, bs) = (r, RightCrumb x l:bs)

goUp :: (Tree a, Breadcrumbs a) -> (Tree a, Breadcrumbs a)
goUp (t, LeftCrumb x r:bs) = (Node x t r, bs)
goUp (t, RightCrumb x l:bs) = (Node x l t, bs)

type Zipper a = (Tree a, Breadcrumbs a)

modify :: (a -> a) -> Zipper a -> Zipper a
modify f (Node x l r, bs) = (Node (f x) l r, bs)
modify f (Empty, bs) = (Empty, bs)
-- ^ modify tree
-- `modify (\_ -> 'Z') (goLeft (testTree, []))` -> `(Node 'Z' Empty Empty,[LeftCrumb 'A' (Node 'C' Empty Empty)])`

attach :: Tree a -> Zipper a -> Zipper a
attach t (_, bs) = (t, bs)
-- ^ attach to tree
-- `(attach (Node 'X' Empty Empty) (goLeft (goLeft (testTree, []))))`

topMost :: Zipper a -> Zipper a
topMost (t, []) = (t, [])
topMost z = topMost (goUp z)

-- `topMost $ (attach (Node 'X' Empty Empty) (goLeft (goLeft (testTree, []))))` ->
-- ```
-- (Node 'A'
-- 	 (Node 'B'
-- 	   (Node 'X' Empty Empty)
-- 	   Empty)
-- 	 (Node 'C' Empty Empty))
-- ```



