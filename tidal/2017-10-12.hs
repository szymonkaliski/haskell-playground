-- https://tidalcycles.org/patterns.html (Composing Multi-Part Patterns) .. https://tidalcycles.org/patterns.html (Synths)

d1 $ fastcat [sound "bd sn:2",
              sound "casio casio:1 casio:2*2",
              sound "drum drum:2 drum:3 drum:4*2"]

-- `fastcat` squezees patterns into one, the more patterns there are, the quicker they will be

d1 $ cat [sound "bd sn:2",
          sound "casio casio:1 casio:2*2",
          sound "drum drum:2 drum:3 drum:4*2"]

-- `cat` is like `fastcat` but keeps the original playback speed

d1 $ stack [sound "bd bd*2",
            sound "hh*2 [sn cp] cp future*4",
            sound ((samples "arpy*8") (run 16))]

-- `stack` combines list of patterns by playing each of them simultaneously

d1 $ sound (samples "arpy*8" (run 8)) # speed "0.25"

d1 $ sound (samples "arpy*8" (run 8)) # speed "0.25" # cut "1"

-- `cut` stops "bleeding" of one pattern into another

d1 $ sound (samples "hc*8" (iter 4 $ run 4))

t1 (xfadeIn 2) $ sound "bd(3,8)"
-- `t1` is for transition on `d1`, `xfadeIn` will happen in n cycles (here 2)
