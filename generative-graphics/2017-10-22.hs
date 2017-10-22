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

blackCircle :: Diagram B
blackCircle = circle 1 # fc black # opacity 0.1

pairs xs = zip xs (tail xs)
pairsSum xs = zipWith (\ a b -> (a, a + b)) xs (tail xs)

-- TODO: noise should accumulate when creating diagram, not only in circleLine
circleLine (ns, nm) = hsep 0.1
  $ map (\ (_, offset) -> blackCircle # translateY (offset * 50))
  $ take 100
  $ pairsSum
  $ genNoiseArray ns nm

diagram = foldDiagrams
  $ map circleLine
  $ take 100
  $ zip [0.01,0.02..] (repeat 0.01)

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) diagram
renderOut = renderToFile "out.svg" 800 diagram

main = do
  renderOut
  putStrLn "rendered!"
