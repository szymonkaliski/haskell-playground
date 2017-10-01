-- https://github.com/tidalcycles/Tidal/blob/master/tutorial/tutorial.md .. https://github.com/tidalcycles/Tidal/blob/master/tutorial/tutorial.md (Functions)

d1 $ sound "can" -- loop sound "can"

d1 $ sound "can:1" -- different "can" sounds

-- available sounds:
-- flick sid can metal future gabba sn mouth co gretsch mt arp h cp
-- cr newnotes bass crow hc tabla bass0 hh bass1 bass2 oc bass3 ho
-- odx diphone2 house off ht tink perc bd industrial pluck trump
-- printshort jazz voodoo birds3 procshort blip drum jvbass psr
-- wobble drumtraks koy rave bottle kurt latibro rm sax lighter lt
-- arpy feel less stab ul

d1 $ sound "stab"

d1 $ silence -- stop d1
hush -- stop everything

d1 $ sound "can:1" |+| vowel "a" -- `|+|` applies effects

d1 $ sound "stab" |+| speed "-0.2" |+| vowel "h"

-- available effects:
-- `accelerate` - a pattern of numbers that speed up (or slow down) samples while they play.
-- `bandf` - a pattern of numbers from 0 to 1. Sets the center frequency of the band-pass filter.
-- `bandq` - a pattern of numbers from 0 to 1. Sets the q-factor of the band-pass filter.
-- `begin` - a pattern of numbers from 0 to 1. Skips the beginning of each sample, e.g. 0.25 to cut off the first quarter from each sample.
-- `coarse` - fake-resampling, a pattern of numbers for lowering the sample rate, i.e. 1 for original 2 for half, 3 for a third and so on.
-- `crush` - bit crushing, a pattern of numbers from 1 for drastic reduction in bit-depth to 16 for barely no reduction.
-- `cutoff` - a pattern of numbers from 0 to 1. Applies the cutoff frequency of the low-pass filter.
-- `delay` - a pattern of numbers from 0 to 1. Sets the level of the delay signal.
-- `delayfeedback` - a pattern of numbers from 0 to 1. Sets the amount of delay feedback.
-- `delaytime` - a pattern of numbers from 0 to 1. Sets the length of the delay.
-- `end` - the same as begin, but cuts the end off samples, shortening them; e.g. 0.75 to cut off the last quarter of each sample.
-- `gain` - a pattern of numbers that specify volume. Values less than 1 make the sound quieter. Values greater than 1 make the sound louder.
-- `hcutoff` - a pattern of numbers from 0 to 1. Applies the cutoff frequency of the high-pass filter.
-- `hresonance` - a pattern of numbers from 0 to 1. Applies the resonance of the high-pass filter.
-- `pan` - a pattern of numbers between 0 and 1, from left to right (assuming stereo)
-- `resonance` - a pattern of numbers from 0 to 1. Applies the resonance of the low-pass filter.
-- `shape` - wave shaping distortion, a pattern of numbers from 0 for no distortion up to 1 for loads of distortion (watch your speakers!)
-- `sound` - a pattern of strings representing sound sample names (required)
-- `speed` - a pattern of numbers from 0 to 1, which changes the speed of sample playback, i.e. a cheap way of changing pitch
-- `unit` - a pattern of words specifying the unit that the speed parameter is expressed in. Can either be 'rate' (the default, percentage playback rate), 'cycle' (cycle/n), or 'secs' (n seconds)
-- `vowel` - formant filter to make things sound like vowels, a pattern of either a, e, i, o or u. Use a rest (~) for no effect.

d1 $ sound "pluck:8 pluck:1 ~ [~ pluck:2]" |+| speed "-0.9" |+| vowel "i" |+| crush 16 |+| delay 0.84
--         ^ multiple samples form sequence `~` is a pause, `[]` subdivides into sequences, `{}` subdivides somre more

d2 $ sound "[~ pluck:1] [~ pluck:3] [{pluck:5 pluck:8} pluck:0]" |+| speed "0.9" |+| delay 0.84 |+| shape 0.8 |+| gain 0.8

d3 $ sound "[perc:2*4 ~ !?]/2" |+| speed "0.9" |+| shape 0.9
--                ^ "can*2" is the same as "can can", `!` repeats last thing, `?` after thing makes it happen sometimes

d1 $ sound "pluck(2,3)"
--               ^ `(x,y)` - distribute `x` times inside `y` steps
