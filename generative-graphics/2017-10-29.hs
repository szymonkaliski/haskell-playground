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

stepDistance = 1
turnAngle = 30

getPosition :: Turtle -> Position
getPosition (Turtle p _) = p

getAngle :: Turtle -> Main.Angle
getAngle (Turtle _ a) = a

moveForward :: TurtleStatus -> TurtleStatus
moveForward ((Turtle (x, y) angle), ds) = ((Turtle (nx, ny) angle), ds)
  where nx = (x + (sin (angle / 360) * pi) * stepDistance)
        ny = (y + (cos (angle / 360) * pi) * stepDistance)

drawLineAndMoveForward :: TurtleStatus -> TurtleStatus
drawLineAndMoveForward (t, ds) = (nt, d:ds)
  where (nt, _) = moveForward (t, ds)
        d = fromVertices $ map p2 [(getPosition t), (getPosition nt)]

turnRight :: TurtleStatus -> TurtleStatus
turnRight ((Turtle pos angle), ds) = ((Turtle pos (angle + turnAngle)), ds)

turnLeft :: TurtleStatus -> TurtleStatus
turnLeft ((Turtle pos angle), ds) = ((Turtle pos (angle - turnAngle)), ds)

turtleNop :: TurtleStatus -> TurtleStatus
turtleNop ts = ts

getRuleFn :: Char -> (TurtleStatus -> TurtleStatus)
getRuleFn r = case r of
                    'F' -> drawLineAndMoveForward
                    'G' -> moveForward
                    '+' -> turnRight
                    '-' -> turnLeft
                    _ -> turtleNop

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
renderOut = renderToFile "out.svg" 50 diagram

main = do
  renderOut
  putStrLn "rendered!"
