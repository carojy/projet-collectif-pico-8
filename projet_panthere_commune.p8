pico-8 cartridge // http://www.pico-8.com
version 29
__lua__

function _init()
	pl = {
		x=50, y=60,
		dx=0, dy=0, --init vitesse
		speed = 1,
		w = 8, h =8 --largeur et hauteur
		}
end


function _update()
 if (btn(➡️)) pl.dx+=pl.speed
 if (btn(⬅️)) pl.dx-=pl.speed
 if (btn(⬆️)) pl.dy-=pl.speed
 if (btn(⬇️)) pl.dy+=pl.speed
 
 --gestion mv diag
 if can_move(pl.x+pl.dx, pl.y, pl.w, pl.h)
	then pl.x += pl.dx
end
if can_move(pl.x, pl.y+pl.dy, pl.w, pl.h)
	then pl.y += pl.dy
end
pl.dx, pl.dy = 0,0
end


function _draw()
cls()
 map(0,0,0,0,128,128)
	update_camera()
 if not (btn(➡️) or btn(⬅️) or btn(⬆️) or btn(⬇️)) then
 spr(65, pl.x, pl.y)
	end
 	if btn(➡️) then
  spr(69, pl.x, pl.y)
  elseif btn(⬅️) then
	 spr(69, pl.x, pl.y, 1, 1, true)
		end
 		if btn(⬆️) then
			spr(67, pl.x, pl.y)
			elseif btn(⬇️) then
			spr(65, pl.x, pl.y)
 		end
end




-->8
--mouvement

function can_move(x, y, w, h)
	if (check_obstacle(x, y)) return false         -- coin haut-gauche
	if (check_obstacle(x+w-1, y)) return false     -- coin haut-droite
	if (check_obstacle(x, y+h-1)) return false     -- coin bas-gauche
	if (check_obstacle(x+w-1, y+h-1)) return false -- coin bas-droite
	return true
end


function check_obstacle(x,y)
	local map_x = flr(x/8)
	local map_y = flr(y/8)
	local sprite = mget(map_x, map_y)
	return fget(sprite, 0)
end
-->8
--camera

function update_camera()
	local camx=flr(pl.x/128)
	local camy=flr(pl.y/128)
	camera(camx*128,camy*128)
end
__gfx__
00000000333333333333333333bbbb33333333331111111111111111444444444444444400000000ffffffff9999999999999999000000000000000000000000
000000003333333333a333333bbaab13366666331111111111111111444444444444444400000000ffffffff9999999999855899000000000000000000000000
00700700333333333a9a33333bbbab1366ddd6631111111111111111666666666666666600000000ffffffff9999999999855899000000000000000000000000
000770003333333333a3333331bbb31366d506631111111111111111cccccccccccccccc00000000ffffffff99999999988aa889000000000000000000000000
0007700033333333333333a33314113366dd56631111111111111111111111111111111100000000ffffffff99999999988a0889000000000000000000000000
007007003333333333333a9a33344333666666631111111111111111111111111111111100000000ffffffff9999999998855889000000000000000000000000
0000000033333333333333a333444433366666331111111111111111111111111111111100000000ffffffff9999999999588599000000000000000000000000
00000000333333333333333333333333333333331111111111111111111111111111111100000000ffffffff9999999999999999000000000000000000000000
00000000000000000000000000000000000000001111111111111111111111111111111100000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000001111111111111111000000000000000000000000004400044000440000000000000000000000000000000000
00000000000000000000000000000000000000001111111111111111000000000000000000000000004400044000440000000000000000000000000000000000
00000000000000000000000000000000000000001111111111111111000000000000000000000000044440444404444000000000000000000000000000000000
00000000000000000000000000000000000000001111111111111111000000000000000000000000444444444444444400000000000000000000000000000000
00000000000000000000000000000000000000001111111111111111000000000000000000000000044440444404444000000000000000000000000000000000
00000000000000000000000000000000000000001111111111111111000000000000000000000000004400044000440000000000000000000000000000000000
00000000000000000000000000000000000000001111111111111111000000000000000000000000004400044000440000000000000000000000000000000000
11110001111101110000000000000000000000000000000044444444111111111141141100000000044440444404444000000000000000000000000000000000
11110001111101010000000000000000000440000000000044444444111111111144441100000000444444444444444400000000000000000000000000000000
01111111111000010000000000000000004444000000000044444444111111111141141100000000044440444404444000000000000000000000000000000000
1111111111110011000000000000000004e44e400000000044444444444444441144441100000000004400044000440000000000000000000000000000000000
111e1111e111011000000000000000004ee44ee40000000044444444141414141141141100000000004400044000440000000000000000000000000000000000
001ee11ee10001000000000000000000444ff4440000000044444444141414141144441100000000000000000000000000000000000000000000000000000000
00111111110001000000000000000000444444440000000044444444444444441141141100000000000000000000000000000000000000000000000000000000
0001100110000100000000000000000004f00f400000000044444444111111111144441100000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
77777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777777
00000000011001100110011001100110011001100010001000100010000000007777777700000000000000000000000000000000000000000000000000000000
00000000011111100111111001111110011111100011111100111111000000007777777700000000000000000000000000000000000000000000000000000000
0070070001c11c1001c11c100111111001111110001c11c1001c11c1000000007777777700000000000000000000000000000000000000000000000000000000
00077000011111100111111001111110011111100011111100111111000000007777777700000000000000000000000000000000000000000000000000000000
00077000011111100111111001111110011111101011111110111111000000007777777700000000000000000000000000000000000000000000000000000000
00700700000110011001100000011001100110001000110010001100000000007777777700000000000000000000000000000000000000000000000000000000
00000000011111111111111001111111111111100111110001111100000000007777777700000000000000000000000000000000000000000000000000000000
00000000011001100110011001100110011001101000001000101000000000007777777700000000000000000000000000000000000000000000000000000000
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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000008080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
80808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080808080
__gff__
0000000101010101010000000100000000000000000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
030301010103030302010303010303030b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101010101010303010301010303030b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101010301010101010101010303040b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101030307280707070707010101040b0b0b0b0b0b070707070b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
070707070716281616161605070102040b0b0b0b0707061616060b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
05050516160526272727272616070707280707070606161616060b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
05050505050528050505052627260506280606161616161616060728070707070b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101010101010101040505052627272616161616161616161616280516161607070b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010103030301010104010201051616162816161606060616161616280516161616160b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010303030101010301010106060628161616060606060616162816161616161607070b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101010103010201030303010101040b0b0b0b0b0606061616262626161616161616160606060b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010201010101010101030303010101040b0b0c0c0b060606061626262616161616161616060606060b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010202010101010202010303030101040b0c0c0c0b06060606061628161616161616160606060606060b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101010101010101010103030101040b0b0c0c0b06060606060628161616161616060606060606060b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101010102010101010101010101040b0b0b0b0b06060606060628060616161606060606060606060b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010404010201030301010101010101040b0b0b0b0b0b0606060606280606060606060606060606060b0b0b0b0b0b0b0b0b0b0b0b01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010401010101030301010101010101040b0b0b0b0b0b0b06060606280606060606060606060606060b0b0b0b0b0b0b0b0b0b0b0b01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101010101010301010101010101040b0b0b0b0b0b0b060606062806060606060606060606060b0b0b0b0b0b0b0b0b0b0b0b0b01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010103010101010101010101010101040b0b0b0b0b0b0b0b0606062806060606060606060606060b0b0b0b0b0b0b0b0b0b0b0b0b01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010303010101010101010101010101040b0b0b0b0b0b0b0b0b0b0628060606060606060606060b0b0b0b0b0b0b0b0b0b0b0b0b0b01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101010101010101010101010101040b0b0b0b0b0b0b0b0b0b0b0b0606060606060606060b0b0b0b0b0b0b0b0b0b0b0b0b0b0b01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101010101010101010101010101040b0b0b0b0b0b0b0b0b0b0b0b04010606060606010b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
01010101010101010101010101010104040b0b0b0b0b0b0b0b0b0b0404010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
010101010101010101010101010101010404040404040b0b0b0b0b0b04010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
