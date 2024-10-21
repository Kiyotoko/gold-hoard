pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- game
-- by leo and karl

#include main.lua
#include utility.lua
#include handlers.lua
#include doors.lua
#include items.lua
#include plates.lua

__gfx__
77777777777777777777777777777777777777777777777777770007777777777777777777777777000000000000000000000000000000000000000000000000
77777777000007777777777770007777700077770077777777708880000777777700700000077777000000000000000000000000000000000000000000000000
77777000088800777777770008880077708800000007777777700880880077777088088888800777000000000000000000000000000000000000000000000000
77700088888008077770008888800807770888888880777777008888888000777088888888888007000000000000000000000000000000000000000000000000
77008888888888077700888888888807700888888880077777088888880080777708888888888880000000000000000000000000000000000000000000000000
70088888888880777008888888888077708888888888077777700888888880077770088888888080000000000000000000000000000000000000000000000000
70008880088800777008888888880077770800888888077777702008888880777770000800888007000000000000000000000000000000000000000000000000
77080002200080777700888888800077777020000808077777702020888880777770022020000077000000000000000000000000000000000000000000000000
77080202202080777702088888802077770220220800777777702220888807777770222022020777000000000000000000000000000000000000000000000000
77700222222007777770088888800777777022222007777777770200888007777777022220007777000000000000000000000000000000000000000000000000
77002022220200777700208888020077777700002220777777770222000020777770200002220777000000000000000000000000000000000000000000000000
70222200002222077022220000222207777770022220777777702222222007777777002222222077000000000000000000000000000000000000000000000000
70220222222022077022022222202207777770222220777777702202222077777777702222022077000000000000000000000000000000000000000000000000
77000222222000777700022222200077777777020007777777770022202077777777702022200777000000000000000000000000000000000000000000000000
77770200002077777777020000207777777777022077777777777022000777777777770002207777000000000000000000000000000000000000000000000000
77770007700077777777000770007777777777000777777777777000077777777777777700007777000000000000000000000000000000000000000000000000
77777777770007777777777777000777777777777777777777770007777777777777777777777777000000000000000000000000000000000000000000000000
77777777008880777777777700888077700077770077777777708880000777777777777777777777000000000000000000000000000000000000000000000000
77700000888808077770000088800007708800000007777777700880880077777700700000077777000000000000000000000000000000000000000000000000
77088888888888807708888888888807770888888880777777008888888000777088088888800777000000000000000000000000000000000000000000000000
70088888888888077008888888888807700888888880077777088888880080777088888888888007000000000000000000000000000000000000000000000000
70808888008800777088888888880077708888888888077777700888888880077708888888888880000000000000000000000000000000000000000000000000
77080080220080777700888888880077770800888888077777702008888880777770088888888080000000000000000000000000000000000000000000000000
77080202202080777702088888802077770020000808077777700020888880777770000800888007000000000000000000000000000000000000000000000000
77700202202000777770088888800077777020220800777777700220888807777770022020000077000000000000000000000000000000000000000000000000
77702022220222077770208888022207770220222007777777022222088000777770222022020777000000000000000000000000000000000000000000000000
77022200002202077702220000220207777022220207777777022222000022077777022220222077000000000000000000000000000000000000000000000000
70220222020000777022022202000077777700002220777777700022222022077777700000222077000000000000000000000000000000000000000000000000
70220002222077777022000222207777770000222200777777777000222000077777702002220777000000000000000000000000000000000000000000000000
77000000222077777700000022207777770220220202077777777777022207777777022202200777000000000000000000000000000000000000000000000000
77777770220777777777777022077777777022000002077777777777702207777777022070007777000000000000000000000000000000000000000000000000
77777777000777777777777700077777777700777700777777777777770077777777700777777777000000000000000000000000000000000000000000000000
77777777700007777777777770000777777777777777777777777777777777777777777777777777000000000000000000000000000000000000000000000000
77777770088880777777777000888077700077770077777777770007777777777700700000077777000000000000000000000000000000000000000000000000
77700008888808077770000088800007708800000007777777708880000777777088088888800777000000000000000000000000000000000000000000000000
77088888888888807708888888888807770888888880777777700880880077777088888888888007000000000000000000000000000000000000000000000000
70888888888888077008888888888807700888888880077777008888888000777708888888888880000000000000000000000000000000000000000000000000
70808888008800777088888888880077708888888888077777088888880080777770088888888080000000000000000000000000000000000000000000000000
77080080220080777700888888880077770800888888077777700888888880077770000800888007000000000000000000000000000000000000000000000000
77080202202080777702088888802077770020000808077777702008888880777770022020000077000000000000000000000000000000000000000000000000
77000202202007777700088888800077777020220808077777700020888880777770222022020077000000000000000000000000000000000000000000000000
70222022220207777022208888020777770220220800777777702020888807777770022220222207000000000000000000000000000000000000000000000000
70220200002220777022020000222077777022222007777777770222088007777702200002222207000000000000000000000000000000000000000000000000
77000222020222077700022202022207777700002220077777770220000077777702002022000077000000000000000000000000000000000000000000000000
77770222200022077777022220002207770000220222207777770222002077777700702220007777000000000000000000000000000000000000000000000000
77770220000000777777022000000077770222220202207777777022022207777777022207777777000000000000000000000000000000000000000000000000
77777022077777777777702207777777777022000000007777777000702207777777022077777777000000000000000000000000000000000000000000000000
77777000777777777777700077777777777700777700777777777777770077777777700777777777000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666000006960000077777777777777000006960000000000696666666666960000069677777777776966666666666666666000000000000000000000000
66666666000006960000077777777777777000006960000000000696666666666960000069677777777776966666666666666666000000000000000000000000
66666666000006960000077777777777777000006960000000000696666666666960000069677777777776966666666666666666000000000000000000000000
66666666000006960000077777777777777000006960000000000696666666666960000069677777777776966666666666666666000007777777777777700000
66666666000006960000077777777777777000006960000000000696666666666960000069677777777776966666666666666666000007777777777777700000
66666666000006960000066666666666666000006960000000000699999999999960000069666666666666966999999999999996000007777777777777700000
66666666000006960000069999999999996000006960000000000666666666666660000069999999999999966966666666666696000007777777777777700000
66666666000006960000069666666666696000006960000000000000000000000000000066666666666666666960000000000696000007777777777777700000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66655666000000000000000077755777000000000000000000000000666556660000000000000000000000000000000000000000000000000000000000000000
66655666000000000000000077755777000000000000000000000000661551660000000000000000000000000000000000000000000000000000000000000000
66155166000000000000000077755777000000000000000000000000661111660000000000000000000000000000000000000000000000000000000000000000
66155166000000000000000077155177000000000000000000000000661551660000000000000000000000000000000000000000000000007775577700000000
66155166000000000000000077155177000000000000000000000000661551660000000000000000000000000000000000000000000000007715517700000000
66155166000000000000000066111166000000000000000000000000999559990000000000000000000000000000000000000000000000007711117700000000
66655666000000000000000099155199000000000000000000000000666556660000000000000000000000000000000000000000000000007715517700000000
66655666000000000000000066655666000000000000000000000000000000000000000000000000000000000000000000000000000000007775577700000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
68888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886
68222286682222866822228668222286682222866822228668222286682222866822228668222286682222866822228668222286682222866822228668222286
68222286682222866822228668222286682222866822228668222286682222866822228668222286682222866822228668222286682222866822228668222286
68222286682222866822228668222286682222866822228668222286682222866822228668222286682222866822228668222286682222866822228668222286
68222286682222866822228668222286682222866822228668222286682222866822228668222286682222866822228668222286682222866822228668222286
68888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886688888866888888668888886
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
6bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb6
6b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b6
6b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b6
6b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b6
6b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b66b3333b6
6bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb66bbbbbb6
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010000000101010101010101000000010101010000000000000000000000001121418101010101000000000000000002010102000000020000000000020000
0100000000000001000000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000101010100010101010101010101010101010101010001000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
8d8e8e8e8e8e8e8f008d8e8e8e8e8e8e8f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8283838383838384008283838383838384000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81808080808080850e8180808080808085000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81808080808080857d8180808080808085000000009090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8180808080808085908180808080808085909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8180808080808089a38a80808080808085909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
81808080c0808080a08080808080808085909090909090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
818080808080808ba78c80808080808085900000009090909000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8180808080808085008180808080808085000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8180808080808085008180808080808085000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8180808080808085008180808080808085000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8687878787878788008687878787878788000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000004e4e4e4e4e00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
00010000200502003020050200501e0501a05015050100500b0500605005050050500505005050060500705008050090500b0500e050140501505017050180501a0501a0501c0501a05001050020500b05014050
0010000020050200502005020050200501f0501f0501e0501d0501c0501b050190501805014050130500f0500d050090500405003050020500105001050020500305004050050500605007050090500a0500b050
__music__
00 41024344

