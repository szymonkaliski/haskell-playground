module Learn where

-- http://learnyouahaskell.com/zippers .. http://learnyouahaskell.com/zippers (Manipulating trees under focus)

data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show)

-- ^ binary Tree

freeTree :: Tree Char
freeTree =
  Node 'P'
    (Node 'O'
      (Node 'L'
        (Node 'N' Empty Empty)
        (Node 'T' Empty Empty))
      (Node 'Y'
        (Node 'S' Empty Empty)
        (Node 'A' Empty Empty)))
    (Node 'L'
      (Node 'W'
        (Node 'C' Empty Empty)
        (Node 'R' Empty Empty))
      (Node 'A'
        (Node 'A' Empty Empty)
        (Node 'C' Empty Empty)))


data Direction = L | R deriving (Show)
-- ^ are we going [L]eft or [R]ight

type Breadcrumbs = [Direction]
-- ^ history of Directions

goLeft :: (Tree a, Breadcrumbs) -> (Tree a, Breadcrumbs)
goLeft (Node _ l _, bs) = (l, L:bs)

goRight :: (Tree a, Breadcrumbs) -> (Tree a, Breadcrumbs)
goRight (Node _ _ r, bs) = (r, R:bs)

-- ^ `goLeft`/`goRight` return subtree matching L or R
-- `goLeft (freeTree, [])` -> `(Node 'O' (Node 'L' (Node 'N' Empty Empty) (Node 'T' Empty Empty)) (Node 'Y' (Node 'S' Empty Empty) (Node 'A' Empty Empty)),[L])`

x -: f = f x
-- ^ helper function to swap what is applied to what:
-- `(freeTree, []) -: goLeft -: goLeft`

data Crumb a = LeftCrumb a (Tree a) | RightCrumb a (Tree a) deriving (Show)
type Breadcrumbs' a = [Crumb a]
-- ^ Breadcrumbs, but with additional data about parent, and non-visited node

goLeft' :: (Tree a, Breadcrumbs' a) -> (Tree a, Breadcrumbs' a)
goLeft' (Node x l r, bs) = (l, LeftCrumb x r:bs)

goRight' :: (Tree a, Breadcrumbs' a) -> (Tree a, Breadcrumbs' a)
goRight' (Node x l r, bs) = (r, RightCrumb x l:bs)

goUp :: (Tree a, Breadcrumbs' a) -> (Tree a, Breadcrumbs' a)
goUp (t, LeftCrumb x r:bs) = (Node x t r, bs)
goUp (t, RightCrumb x l:bs) = (Node x l t, bs)
-- ^ depending on if we are at Left or Right crumb, we construct new node based on tree, and left/right crumb value
-- this means that if we have `Tree` and `Breadcrumbs` we can rebuild whole tree, and focus on subtree
-- this basically is a zipper:

type Zipper a = (Tree a, Breadcrumbs' a)
