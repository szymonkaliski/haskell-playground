-- https://tidalcycles.org/patterns.html .. https://tidalcycles.org/patterns.html (Modiyfing Sequenes Wiht Functions)

d1 $ sound "bd" # n "3" -- same as "bd:3"

solo $ d1 $ sound "bd sn" -- solo isolates channel

d1 $ sound "[bd bd] [sd sd sd]"

d1 $ sound "bd bd . sd sd sd" -- `.` nests groups same as `[]`

d1 $ sound "[bd bd bd, sd cp sd cp]" -- `,` layers groups

d1 $ sound "bd <arpy:1 arpy:2>" -- same as "bd arpy:1 bd arpy:2"



