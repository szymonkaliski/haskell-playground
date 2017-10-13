-- https://tidalcycles.org/patterns.html (Synths) .. end

d1 $ fast 0.4 $ speed "0.3*3 0.2*3" # midinote "60" # s "sine" # room 0.5

d1 $ n "c5 d5 e5" # s "sine"




d1 $ fast "0.75" $ n "d3? d4*2 e3 a3 f3 c3?" # s "supersaw" # speed "0.3 0.2" # shape 0.6 # room 0.8 # delay 0.4

d2 $ fast "0.25" $ n "a2 ~ a1 ~ c2" # s "supersaw" # speed "-0.1" # room 0.9 # shape 0.9 # gain 0.9

d3 $ fast "1.5" $ n "d7 a7" # s "supersaw" # speed "-0.9" # room 0.2 # shape 0.9 # gain 0.5 # delay 0.8

hush
