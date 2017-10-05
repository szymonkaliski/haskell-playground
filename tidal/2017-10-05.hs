let effects = crush 7 |+| resonance "0.4"

d1 $ sound "newnotes*3 newnotes:3 ~ newnotes:4 ~ newnotes:5" |+| speed "-0.2" |+| effects

d2 $ sound "newnotes*4 newnotes:3 ~ newnotes:4 ~ newnotes:5" |+| speed "-0.1" |+| effects

hush

d1 $ weave 16
  (weave 2 (pan sine1) [sound "tink:1*2 tink:2/2 tink:3/2", sound "[tink:4 ~]*4"] |+| speed "-0.4" |+| gain "1.2")
  [vowel "e o", vowel "e u", speed "2 ~ 1 ~"]

d2 $ weave 8 (pan sine1) [sound "tink:1*2 tink:2/2 tink:3/2", sound "[tink:4 ~]*4"]
  |+| crush 7
  |+| gain "0.9 0.4 0.8 0.9"
  |+| delay "0.1 0.5 0.9 0.2"
  
hush
