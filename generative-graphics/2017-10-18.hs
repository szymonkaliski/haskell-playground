import Diagrams.Prelude
import Diagrams.Backend.SVG

-- diagrams
diagram :: Diagram B

-- diagram = hcat $ map (\ s -> circle s # alignB) $ [1,0.8..0.1]
-- `alignT`, `alignB`, `alignL`, `alignR` can align things

-- diagram = hsep 0.5 $ map (\ w -> regPoly w 1) [3..9] # fc black
-- `regPoly` creates regular polygon with n walls

-- diagram = foldr1 mappend [(circle 1), (square 1), (circle 0.2)]
-- diagram = foldr1 mappend $ map (\ w -> regPoly w 1) [3..9]

blackCircle = circle 0.1 # fc black
circleEdges w = atPoints (trailVertices $ regPoly w 1) $ repeat blackCircle
diagram = foldr1 mappend $ map circleEdges [3,6..30]

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) diagram
renderOut = renderToFile "out.svg" 400 diagram

main = do
  renderOut
  putStrLn "rendered!"
