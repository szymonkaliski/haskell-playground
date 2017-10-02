-- https://github.com/tidalcycles/Tidal/blob/master/tutorial/tutorial.md (Functions) .. end

-- `d1`..`d10` - takes a pattern and sends to superdirt (supercollider)
-- `stack` - play sever patterns

d1 $ stack [sound "bd sn:2" |+| vowel "[a e o]/2",
            sound "casio casio:1 casio 2*2"]

-- `cat` - patterns will be played one after another, instead of at the same time (`stack`)

d1 $ cat [sound "bd sn:2" |+| vowel "[a e o]/2",
         sound "casio casio:1 casio 2*2"]

-- `slowcat` - like `cat`, but maintains speed of playback

d1 $ slowcat [sound "bd sn:2" |+| vowel "[a e o]/2",
              sound "casio casio:1 casio 2*2"]

-- `slow` - slow down a pattern
-- `density` - speed it up
-- `rev` - reverse pattern
-- `chop` - chops each sample into given number of bits

d1 $ slow 2 $ sound "bd ~ sn bd ~ [~ bd]/2 [sn [~ bd]/2] ~"

d1 $ density 2 $ sound "bd ~ sn bd ~ [~ bd]/2 [sn [~ bd]/2] ~"

d1 $ rev $ sound "bd ~ sn bd ~ [~ bd]/2 [sn [~ bd]/2] ~"

d1 $ rev $ chop 16 $ slow 2 $ sound "bd ~ sn bd ~ [~ bd]/2 [sn [~ bd]/2] ~"

-- `every` - do something every other time
-- `sometimes` - like `every` but applies given function at random

d1 $ every 2 rev $ sound "bd can sn can:4"

d1 $ sometimes (density 2) $ sound "bd can sn can:4"

-- `weave` - takes synth params and overlays them with offset

d1 $ weave 2 (pan sine16)
  [sound "bd sn",
   sound "arpy ~ arpy:3",
   sound "can ~ ~ can:4"]

d1 $ weave 2 (sound "arpy arpy:7 arpy:3")
  [vowel "a e i",
   vowel "o i",
   vowel "a i e o",
   speed "2 4 ~ 2 1"]

-- `~>` and `<~` shift patterns by some amount in left or right direction

d1 $ 0.25 ~> sound "arpy arpy:1 arpy:2 arpy:3"

d1 $ 0.25 <~ sound "arpy arpy:1 arpy:2 arpy:3"

d1 $ sound "arpy arpy:1 arpy:2 arpy:3"

d1 $ sometimes (0.25 <~) $ sound "arpy arpy:1 arpy:2 arpy:3" |+| speed "-0.5"

-- `iter` - shifts pattern by 1/n left every cycle

d1 $ iter 4 $ sound "arpy arpy:2 arpy:3"

d1 $ jux (iter 8) $ sound "arpy arpy:2 arpy:3" -- `jux` happens only on one channel

-- `scale` - scales a pattern

d1 $ jux (iter 4) $ sound "arpy arpy:2*2" |+| speed (slow 4 $ scale 0 0.5 sine1) -- here sine1 is scaled to be 0..0.5

-- `samples` - combines two arrays into a pattern

d1 $ jux (slow 2)
   $ sound (samples "drum can can" (slow 1.0 "0 6 2 1 4 3"))


