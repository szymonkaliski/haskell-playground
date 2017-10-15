import Graphics.Gloss

window :: Display
window = InWindow "GLOSS" (200, 200) (10, 10)

background :: Color
background = makeColor 0.8 0.8 0.8 1.0

drawing :: Picture
drawing = circle 80

main :: IO ()
main = display window background drawing
