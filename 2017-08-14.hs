module Learn where

-- http://learnyouahaskell.com/modules (Data.Char) .. http://learnyouahaskell.com/making-our-own-types-and-typeclasses

import Data.List

-- character related predicates: `isSpace`, `isLower`, `isAlpha`, `isDigit`, ...
-- character manipulations: `toUpper`, `toLower`, `toTitle`

import qualified Data.Map as Map -- function name clashes otherwise

-- hashmaps
-- `Map.fromList [("A", 1), ("B", 2)]` -- returns Map with the same structure, but without duplicate keys
-- `Map.toList` is reverse of `fromList`
-- `Map.empty` is just `fromList []`
-- `Map.insert key value map` inserts `key`->`value` into `map`
-- `Map.null map` checks if `map` is empty
-- `Map.size map` returns number of keys
-- `Map.singleton "A" 1` == `Map.fromList [("A", 1)]`
-- `Map.lookup key map` looks for `key` and returns value or Nothing
-- `Map.member key map` - True if `key` in `map`
-- `Map.map` and `Map.filter` like `map` and `filter` - work on values, return Map
-- `Map.keys` and `Map.elems` return `keys` or `elems`
-- `Map.insertWith fn key value map` inserts `value` in `map`, if `key` is already there, runs `fn` with value from Map and `value`

import qualified Data.Set as Set -- function name clashes

-- sets
-- `Set.fromList` - set from list
-- `Set.toList` - set to list
-- `Set.intersection`, `Set.difference`, `Set.union` - intersection, difference, union of sets
-- `null`, `size`, `member`, `empty`, `singleton`, `insert`, `delete` like in `Map`

-- to create a module:
-- make new file `MyModule.hs`
--
-- ```
-- module MyModule ( someFunction ) where
-- someFunction :: Float -> Float
-- someFunction x = x * 2
-- ```
--
-- to use: `import MyModule`
--
-- modules can be in folders: `My/Module.hs` then `import My.Module`
