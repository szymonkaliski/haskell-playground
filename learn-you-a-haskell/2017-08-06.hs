module Learn where

-- http://learnyouahaskell.com/starting-out#im-a-list-comprehension .. http://learnyouahaskell.com/types-and-typeclasses

-- list comprehension

doubledNumbers = [x * 2 | x <- [1..10]]

doubledNumbersBiggerThen10 = [x * 2 | x <- [1..10], x * 2 > 10]

xsWithMod7Eq3 = [ x | x <- [50..100], mod x 7 == 3 ]

oddNumbers xs = [ x | x <- xs, odd x ]

myLength xs = sum [1 | _ <- xs] -- every element in list is replaced with '1' and then summed -> length of the list

-- tuples: (10,20)

tmpTuple = ("Yes", True)

-- fst tmpTuple -> "Yes"
-- snd tmpTuple -> True

-- zip - combines two arrays
lettersWithNumbers = zip ['A'..'Z'] [1..26]
lettersWithNumbers' = zip ['A'..'Z'] [1..] -- longer list is cut of by shorter one

-- right triangles with size 24
rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, sum [a, b, c] == 24 ]  
