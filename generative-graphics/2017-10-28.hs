import Data.Map (Map)
import qualified Data.Map as Map

import Diagrams.Prelude
import Diagrams.Backend.SVG

-- L-System
rules = Map.fromList [('F', "FF+[+F-F-F]-[-F+F+F]")]

getRule r = case Map.lookup r rules of
                 Just result -> result
                 Nothing -> [r]

genGeneration axiom = concat $ map getRule axiom

genGenerations :: Int -> [Char] -> [Char]
genGenerations 0 axiom = axiom
genGenerations n axiom = genGeneration (genGenerations (n - 1) axiom)

-- Stack
data Stack a = Stack [a] deriving Show

push :: a -> Stack a -> Stack a
push x (Stack xs) = Stack (x:xs)

pop :: Stack a -> (Maybe a, Stack a)
pop (Stack []) = (Nothing, Stack [])
pop (Stack (x:xs)) = (Just x, Stack xs)

-- Turtle
type Angle = Double
type Position = (Double, Double)
data Turtle = Turtle Position Main.Angle deriving Show
type TurtleStatus = (Turtle, [Diagram B])

stepDistance = 10

getPosition :: Turtle -> Position
getPosition (Turtle p _) = p

moveForward :: TurtleStatus -> TurtleStatus
moveForward ((Turtle (x, y) angle), ds) = ((Turtle ((x + stepDistance), y) angle), ds)

drawLineAndMoveForward :: TurtleStatus -> TurtleStatus
drawLineAndMoveForward (t, ds) = (nt, d:ds)
  where (nt, _) = moveForward (t, ds)
        d = fromVertices $ map p2 [(getPosition t), (getPosition nt)]

turtleNop :: TurtleStatus -> TurtleStatus
turtleNop ts = ts

getRuleFn :: Char -> (TurtleStatus -> TurtleStatus)
getRuleFn r = case r of
                    'F' -> drawLineAndMoveForward
                    'G' -> moveForward
                    _ -> turtleNop

-- '+' -> turnRight
-- '-' -> turnLeft
-- '[' -> saveLocation
-- ']' -> restoreLocation

executeTurtleRules :: [Char] -> TurtleStatus -> TurtleStatus
executeTurtleRules (r:rs) t = executeTurtleRules rs $ getRuleFn r t
executeTurtleRules [] t = t

getDiagrams :: TurtleStatus -> [Diagram B]
getDiagrams (_, ds) = ds

foldDiagrams :: [Diagram B] -> Diagram B
foldDiagrams = foldr1 mappend

diagram :: Diagram B
diagram = foldDiagrams $ getDiagrams $ executeTurtleRules rs ((Turtle (0,0) 0), [])
  where rs = genGenerations 2 "F"

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) (diagram # frame 1)
renderOut = renderToFile "out.svg" 500 diagram

main = do
  renderOut
  putStrLn "rendered!"
