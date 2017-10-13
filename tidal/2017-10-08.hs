-- https://tidalcycles.org/patterns.html (Polymeters) .. https://tidalcycles.org/patterns.html (Introducing Randomness)

d1 $ sound "{bd hh sn cp, arpy bass2 drum notes can}"
-- five note rhythm on pulse of four note rhythm

d1 $ sound "{arpy bass2 drum notes can, bd hh sn cp}"
-- four note rhythm on pulse of five note rhythm

d1 $ sound "{~ ~, arpy bass2 drum notes can}"
d1 $ sound "{arpy bass2 drum notes can}%2"
--         ^ both are equal

d1 $ sometimes (0.5 <~) $ sound "bd*2 cp*2 hh sn"
--                  ^ `<~` and `~>` move samples in time

d1 $ ("[0 0.2 0.1 0.8 0.4]/16" <~) $ sound "bd*2 cp*2 hh sn"
--    ^ moving in time can be used with a pattern
