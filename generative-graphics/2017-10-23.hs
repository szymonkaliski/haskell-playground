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

pairs xs = zip xs (tail xs)
pairsSum xs = zipWith (\ a b -> (a, a + b)) xs (tail xs)

vecFromAngle a = (sin(pi * 2 * a), cos(pi * 2 * a))

line = opacity 0.2 lc black fromOffsets

-- mapIndexed xs = zipWith (\ i v -> (i, v)) [0..] xs

curlyLine ns nm = line $ map (r2 . vecFromAngle) $ take 1000 $ genNoiseArray ns nm

modNoise v = (v / 100.0) + 10.0

diagram = foldDiagrams $ map (\ (ns, nm) -> curlyLine ns nm) $ zip (map modNoise [0..50]) (repeat 0.001)

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) diagram
renderOut = renderToFile "out.svg" 400 diagram

main = do
  renderOut
  putStrLn "rendered!"
