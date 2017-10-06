-- https://tidalcycles.org/patterns.html (Modiyfing Sequenes Wiht Functions) .. https://tidalcycles.org/patterns.html (Euclidean Sequences)

d1 $ rev (sound "bd*2 [bd sn*2 ~ sn]")
--   ^ reverses patterns

d1 $ every 4 rev (sound "bd*2 [bd sn*2 ~ sn]")
--   ^ applies fn (`rev` here) every 4 patterns

d1 $ every 2 (fast 2) $ slow 2 $ sound "bd*2 [bd sn*2 ~ sn]"
--            ^ `fast` and `slow` speed up or slow down patterns

d1 $ every 2 (fast 2) $ slow 2 $ sound "bd*2 [bd sn*2 ~ sn]" # crush "16 4 [2 8]/2"
-- `#` is same as `|=|` (what's the difference from `|+|`?) - different arithmetic operators: `|+|`, `|-|`, `|*|`, `|/|`

d1 $ slow 8 $ sound "tink tink:2 [tink:4]*2" # speed "-0.2" # gain "1.8" # shape (every 3 (fast 2) $ "0.2 1.0") # delayfeedback 0.5

d1 $ sound "tink tink:2 [tink:4]*2" |+| speed "-0.2" |+| gain "0.8" |+| shape "[0.8 0.2]*2 ~ [0.2 0.6]/2"

d1 $ n "2 6 9" # sound "arpy"
-- `n` is like `"arpy:2 arpy:6 arpy:9"` here

d1 $ shape (every 4 (slow 4) $ "0.2 0.3 ~") # gain "1.8" # speed "-0.5 0.2 ~" # sound "bd"
