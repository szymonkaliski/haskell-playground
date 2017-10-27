import Data.Maybe
import Data.Map (Map)
import qualified Data.Map as Map

import Diagrams.Prelude
import Diagrams.Backend.SVG

import Math.Noise.Modules.Perlin
import Math.Noise.NoiseModule
import Math.Noise.NoiseGen

noiseF :: NoiseModule
noiseF = gen perlin

getNoise :: (Double, Double, Double) -> Double
getNoise = fromMaybe 0.0 . getValue noiseF

genNoiseArray start mod = map (\ v -> getNoise (v, 0.0, 0.0)) [start, start + mod ..]

-- l-system

-- rules = Map.fromList [ ('A', "AB"), ('B', "A") ]
rules = Map.fromList [('F', "FF+[+F-F-F]-[-F+F+F]")]

getRule r = case Map.lookup r rules of
                 Just result -> result
                 Nothing -> [r]

genGeneration axiom = concat $ map getRule axiom

genGenerations :: Int -> [Char] -> [Char]
genGenerations 0 axiom = axiom
genGenerations n axiom = genGeneration (genGenerations (n - 1) axiom)

-- load in REPL and: `genGenerations 5 "F"`

-- diagrams
diagram :: Diagram B

foldDiagrams :: [Diagram B] -> Diagram B
foldDiagrams = foldr1 mappend

-- store pos and angle as we go

type Angle = Double
type Position = (Double, Double)
data Turtle = Turtle Position Main.Angle deriving Show

-- data Drawing =

stepDistance = 10

moveForward (Turtle (x, y) angle) = Turtle ((x + stepDistance), y) angle

-- TODO: figure out how to turn turtle into drawing...


-- executeRule r = case r of
--                      'F' -> drawLineAndMoveForward
--                      'G' -> moveForward
                     -- '+' -> turnRight
                     -- '-' -> turnLeft
                     -- '[' -> saveLocation
                     -- ']' -> restoreLocation

diagram = circle 1

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) (diagram # frame 1)
renderOut = renderToFile "out.svg" 500 diagram

main = do
  renderOut
  putStrLn "rendered!"
