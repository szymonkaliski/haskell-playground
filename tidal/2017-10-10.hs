-- https://tidalcycles.org/patterns.html (Introducing Randomness) .. https://tidalcycles.org/patterns.html (Composing Multi-Part Patterns)

d1 $ sound "bd*2" # pan (rand)
-- `rand` is random value between 0 and 1

d1 $ sound "bd*2" # shape (scale 0.25 0.75 $ rand)
-- `rand` can be scaled with `scalez

d1 $ s "bd*2" # n (irand 10)
-- `irand` is random integer

d1 $ sound "bd? sd? sd? sd?"
-- `?` 50/50 chance if sound will play

d1 $ degrade $ sound "bd*16"
-- `?` is shorthand for `degrade`

d1 $ degradeBy 0.25 $ sound "bd*16"
-- `degradeBy` is `degrade` with specified randomness (there's also `sometimesBy`)

-- exmple patterns with lots of variation
d1 $ every 7 (# speed "0.8")
   $ every 3 (0.25 <~)
   $ every 2 (rev)
   $ sound "bd bd:4 bd:2 bd:8"
   # speed "1 1.25 0.75 -1.5"

d1 $ every 3 (rev)
   $ every 2 (density 0.8)
   $ sound "bd hh sn cp"


