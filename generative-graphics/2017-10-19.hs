import Data.Maybe

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

-- diagram = fromOffsets $ map r2 [(1,1), (2,1), (2,2), (3,-4)]
-- `fromOffsets` constructs line from points (each point is relation to previous one)

-- diagram = fromVertices $ map p2 [(1,1), (2,1), (2,2), (3,0)]
-- `fromVertices` is like `fromOffsets` but takes absolute x/y position

genLine n s1 m1 s2 m2 = zip (take n $ genNoiseArray s1 m1) (genNoiseArray s2 m2)

diagram = atop el1 el2
  where
      el1 = fromOffsets $ map r2 $ genLine 10 0.1 0.01 0.6 0.05
      el2 = fromOffsets $ map r2 $ genLine 10 0.4 0.08 0.6 0.05

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) diagram
renderOut = renderToFile "out.svg" 400 diagram

main = do
  renderOut
  putStrLn "rendered!"
