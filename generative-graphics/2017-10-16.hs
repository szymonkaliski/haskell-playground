import Diagrams.Prelude
import Diagrams.Backend.SVG

-- diagrams
diagram :: Diagram B

-- diagram = circle 1

-- diagram = circle 1 # fc yellow
-- diagram = fc yellow $ circle 1
-- ^ `x # f` == `f x`

-- diagram = square 1 # fc yellow # lc blue # lw 1 ||| circle 0.6 # fc blue
-- ^ `|||` puts things next to each other (horizontal)
--
-- diagram = square 1 # fc yellow # lc blue # lw 1 === circle 0.6 # fc blue
-- ^ `===` puts things next to each other (vertical)

-- diagram = atop (square 1 # fc blue) (circle 1 # fc yellow)
-- ^ `atop` puts second thing on top of first

blackCircle = fc black circle

diagram = vsep 1
  $ replicate 10 
  $ hsep 1
  $ map blackCircle
  $ [0.5,1..5] ++ [4.5,4..0.5]

-- ^ `hcat`, `vcat`, `hsep`, `vsep` are for laying things out without using `===` and `|||`

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) diagram
renderOut = renderToFile "out.svg" 200 diagram

main = do
  renderOut
  putStrLn "rendered!"
