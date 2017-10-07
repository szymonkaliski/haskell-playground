-- https://tidalcycles.org/patterns.html (Euclidean Sequences) .. https://tidalcycles.org/patterns.html (Polymeters)

d1 $ sound "bd(5,8)"
-- 5 is distributed equally among 8

d1 $ e 5 8 $ sound "bd"
--   ^ `e` is like "(5,8)"

d1 $ e 3 8 $ sound "bd*2 cp*3"

d1 $ sound "bd(11,24,14)"

cps (80/60/4) -- play at 140 BPM - `cps` is cycles per second

d1 $ sound "arpy*8" # up (run 8)

d1 $ sound "arpy*8" # speed (run 8)

d1 $ up (run 8) # sound "arpy"

d1 $ sound "arpy*8" # up (every 2 (rev) $ run 8)

-- ^ `run` returns pattern of integers up to specified value

d1 $ n "0 2 3" # s "arpy"
--   ^ `n` & `s` - `s` selects sample set, `n` grabs sample by index, same as "arpy:0 arpy:2 arpy:3"

d1 $ n (run 4) # s "drum"

d1 $ s "drum cp hh" # n (run 10)

d1 $ sound "bd sn drum arpy" # pan "0 1 0.25 0.75"
d1 $ pan "0 1 0.25 0.75" # sound "bd sn drum arpy"
-- ^ both are the same!

d1 $ sound "cp*8" # pan sine
d2 $ sound "cp*7" # pan sine

d1 $ sound "bd*16" # pan (slow 8 $ saw)

d1 $ sound "[bd ~]*8" # pan (density 1.75 $ tri)

d1 $ sound "[bd ~]*8" # pan (slowcat [sine, saw, square, tri])

d1 $ sound "bd(5,8)" # speed (scale (-0.6) 0.6 $ square)




