import Data.Maybe
import Data.List

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

-- diagrams
diagram :: Diagram B

foldDiagrams :: [Diagram B] -> Diagram B
foldDiagrams = foldr1 mappend

alignDiagrams :: [Diagram B] -> Diagram B
alignDiagrams = foldr1 (\ a b -> a # alignB <> b # alignT)

snugDiagrams :: [Diagram B] -> Diagram B
snugDiagrams = foldr1 (\ a b -> a # snugL <> b # snugR)

arcLine :: Double -> Diagram B
arcLine r = foldDiagrams
  $ map (\ (i, x) -> arc (rotate (x * tau @@ rad) xDir) (x * tau @@ rad) # rotate ((r * tau) @@ rad) # translateX (i * 4))
  $ zip [1..] [0,0.05..1]

diagram = vsep 2 $ map (\ r -> arcLine r) [0,0.05..1]

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) (diagram # frame 1)
renderOut = renderToFile "out.svg" 500 diagram

main = do
  renderOut
  putStrLn "rendered!"
