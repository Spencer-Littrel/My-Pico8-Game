pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--my first game

x = 60
y = 60

function _draw()
	cls(2)
	spr(2,x,y)
	if (btn(0)) x -= 4
	if (btn(1)) x += 4

	if (btn(2)) y -=	4
	if (btn(3)) y += 4
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000c0000000cccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000c00c000cc777c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700000c00c000cc777c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000cccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700c000000c0cccccc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000cccccc00cc00cc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000cccc000cc00cc000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000