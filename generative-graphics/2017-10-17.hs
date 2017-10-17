import Diagrams.Prelude
import Diagrams.Backend.SVG

-- diagrams
diagram :: Diagram B

-- blackCircle = fc black circle
-- yellowCircle = fc yellow circle
-- diagram = beside (r2 (1, 0.5)) (blackCircle 1) (yellowCircle 1)
-- ^ `beside` places things next to each other, `r2` constructs a vector

-- diagram = atop el $ atop (el # rotateBy (1/3)) (el # rotateBy (2/3))
--   where el = circle 1 # scaleX 0.2 # fc black

-- diagram = el # snugR <> el # snugL
--   where el = circle 1 # scaleX 0.2 # rotateBy (2/3)

-- `snug`* functions allow items to be aligned based on their actual shape (in conjuction with `<>`)

-- available transformations:
-- * `scale`, `scaleX`, `scaleY`
-- * `rotate` (angle), `rotateBy` (fraction of circle)
-- * `reflectX`, `reflectY`
-- * `translate`, `translateX`, `translateY`

diagram = atop el1 el2
  where
    el1 = circle 1 # translate (r2 (3, 0.5)) # fc yellow
    el2 = circle 1 # translate (r2 (0, 0)) # fc black

-- helpers
renderToFile file width diagram = renderSVG file (mkWidth width) diagram
renderOut = renderToFile "out.svg" 200 diagram

main = do
  renderOut
  putStrLn "rendered!"
