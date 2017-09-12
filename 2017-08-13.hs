module Learn where

--  http://learnyouahaskell.com/modules .. http://learnyouahaskell.com/modules (Data.Char)

import Data.List

-- when importing Data.List everything from there becomes top-level thing
-- some of the functions can be imported using:
-- `import Data.List (nub, sort)`
-- importing without top-level bindings:
-- `import qualified Data.Map`, and then Data.Map.fn
-- `import qualified Data.Map as M` and then M.fn

-- some Data.List modules
-- `intersperse '-' "ABC"` -> "A-B-C"
-- `intercalate " " [ "A", "B", "C" ]` -> "A B C"
-- `transpose` is 2d matrix transposition -> [[1,2],[3,4]] -> [[1,3],[2,4]]
-- `concat` is concat - [ "A", "B", "C" ] -> "ABC"
-- `concatMap` is concat with map
-- `and` returns True if everything in the list is True -> `and $ map (> 4) [5,7,10]` -> True
-- `or` is like `and`, but or
-- `any`/`all` are like `and`/`or` but take a fn and array -> `all (> 4) [5,7,9,10` -> True
-- `iterate` takes fn and starting value, and creates infinite list: `takeWhile (< 100) $ iterate (* 2) 1` -> [1,2,4,8,16,32,64]
-- `splitAt` splits list at given index
-- `dropWhile` is like `takeWhile` but drops items
-- `sort` sorts
-- `group` groups adjacent elements into sublits if they are equal
-- `isInfixOf`, `isPrefixOf`, `isSuffixOf` check for infix/prefix/suffix -> `isPrefixOf "he" "hello"` -> True
-- `elem`, `notElem` check if elem is/is not in the list
-- `partition` partitions list by predicate, first list contains elements that match, second ones that do not:
-- `partition (< 3) [1..10]` -> ([1,2],[3,4,5,6,7,8,9,10])
-- `find` takes fn and list and returns Maybe of found item
-- `elemIndex` returns index of elem in list
-- `findIndex` returns index of elem matching fn
-- `lines` splits string at newline
-- `unlines` reverses `lines`
-- `words`/`unwords` same as `lines`/`unlines` but for words
-- `delete` removes first occurence of item in a list: `delete 1 [1,2,1,2]` -> [2,1,2]
-- `\\` is a difference function: `[1..10] \\ [2,5,9]` -> [1,3,4,6,7,8,10]
-- `union` does union on two lists (returns set - no repeating items)
-- `intersect` does set intersection
-- `insert` tries to insert element in sorted array

import Data.Char

