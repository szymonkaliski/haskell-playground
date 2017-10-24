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
snugDiagrams = foldr1 (\ a b -> a # snugB <> b # snugT)

noiseLine :: Double -> Double -> Diagram B
noiseLine ns nm = lw 0.8 fromOffsets
  $ map (\ n -> r2 (1, n * 0.3))
  $ take 200
  $ genNoiseArray ns nm

diagram = alignDiagrams
  $ map (\ n -> noiseLine (n * 0.1) (n * 0.0008))
  $ take 100 [5..]

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) diagram
renderOut = renderToFile "out.svg" 900 diagram

main = do
  renderOut
  putStrLn "rendered!"
