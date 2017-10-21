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

genLine n s1 m1 s2 m2 = zip (take n $ genNoiseArray s1 m1) (genNoiseArray s2 m2)

foldDiagrams :: [Diagram B] -> Diagram B
foldDiagrams = foldr1 mappend

makeLine :: (Double, Double, Double, Double) -> Diagram B
makeLine (s1, m1, s2, m2) = fromOffsets $ map r2 $ genLine 100 s1 m1 s2 m2

diagram = foldDiagrams
  $ map (\x -> makeLine x # lc black # opacity 0.1)
  $ zip4 [0.0,0.02..10] (repeat 0.01) [0.0,0.01..] (repeat 0.01)

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) diagram
renderOut = renderToFile "out.svg" 500 diagram

main = do
  renderOut
  putStrLn "rendered!"
