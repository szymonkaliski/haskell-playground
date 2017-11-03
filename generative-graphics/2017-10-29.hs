import Data.Maybe
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

-- TODO: Maybe would be nice here, but had troubles making it work in `restoreLocation`
-- pop :: Stack a -> (Maybe a, Stack a)
-- pop (Stack []) = (Nothing, Stack [])
-- pop (Stack (x:xs)) = (Just x, Stack xs)

pop :: Stack a -> (a, Stack a)
pop (Stack (x:xs)) = (x, Stack xs)

-- Turtle
type Angle = Double
type Position = (Double, Double)
data Turtle = Turtle Position Main.Angle deriving Show
type TurtleStatus = (Turtle, [Diagram B], Stack Turtle)

stepDistance = 0.1
turnAngle = 100
numIterations = 4

getPosition :: Turtle -> Position
getPosition (Turtle p _) = p

getAngle :: Turtle -> Main.Angle
getAngle (Turtle _ a) = a

moveForward :: TurtleStatus -> TurtleStatus
moveForward ((Turtle (x, y) angle), ds, st) = ((Turtle (nx, ny) angle), ds, st)
  where nx = (x + (sin (angle / 360) * pi) * stepDistance)
        ny = (y + (cos (angle / 360) * pi) * stepDistance)

drawLineAndMoveForward :: TurtleStatus -> TurtleStatus
drawLineAndMoveForward (t, ds, st) = (nt, d:ds, nst)
  where (nt, _, nst) = moveForward (t, ds, st)
        d = lw 0.6 fromVertices $ map p2 [(getPosition t), (getPosition nt)]

turnRight :: TurtleStatus -> TurtleStatus
turnRight ((Turtle pos angle), ds, st) = ((Turtle pos (angle + turnAngle)), ds, st)

turnLeft :: TurtleStatus -> TurtleStatus
turnLeft ((Turtle pos angle), ds, st) = ((Turtle pos (angle - turnAngle)), ds, st)

saveLocation :: TurtleStatus -> TurtleStatus
saveLocation (t, ds, s) = (t, ds, push t s)

restoreLocation :: TurtleStatus -> TurtleStatus
restoreLocation (_, ds, s) = (mnt, ds, nst)
  where (mnt, nst) = (pop s)

turtleNop :: TurtleStatus -> TurtleStatus
turtleNop ts = ts

getRuleFn :: Char -> (TurtleStatus -> TurtleStatus)
getRuleFn r = case r of
                   'F' -> drawLineAndMoveForward
                   'G' -> moveForward
                   '+' -> turnRight
                   '-' -> turnLeft
                   '[' -> saveLocation
                   ']' -> restoreLocation
                   _ -> turtleNop

executeTurtleRules :: [Char] -> TurtleStatus -> TurtleStatus
executeTurtleRules (r:rs) t = executeTurtleRules rs $ getRuleFn r t
executeTurtleRules [] t = t

getDiagrams :: TurtleStatus -> [Diagram B]
getDiagrams (_, ds, _) = ds

foldDiagrams :: [Diagram B] -> Diagram B
foldDiagrams = foldr1 mappend

diagram :: Diagram B
diagram = foldDiagrams $ getDiagrams $ executeTurtleRules rs ((Turtle (0,0) 0), [], Stack [])
  where rs = genGenerations numIterations "F"

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) (diagram # frame 1)
renderOut = renderToFile "out.svg" 400 diagram

main = do
  renderOut
  putStrLn "rendered!"
