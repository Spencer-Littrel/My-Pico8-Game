pico-8 cartridge // http://www.pico-8.com
version 41
__lua__

--cave diver

function _init()
    game_over=false
    make_cave()
    make_player()
   end
    
   function _update()
    if (not game_over) then
     update_cave()
     move_player()
     check_hit()
    else
     if (btnp(5)) _init() --restart
    end
   end
    
   function _draw()
    cls()
    draw_cave()
    draw_player()
    
    if (game_over) then
     print("game over!",44,44,7)
     print("your score:"..player.score,34,54,7)
     print("press x to play again!",18,72,6)
    else
     print("score:"..player.score,2,2,7)
    end
   end


-->8
--player sprite

function make_player()
    player={}
    player.x=64    --position
    player.y=64

    --fall speed
    player.dx=0 
    
    --sprites
    player.left=3
    player.right=4
    player.dead=6

    --fly speed
    player.speed=1
    player.score=0
   end
    
   function draw_player()
    if (game_over) then
     spr(player.dead,player.x,player.y)
    elseif (player.dx<=0) then
     spr(player.left,player.x,player.y)
    else
     spr(player.right,player.x,player.y)
    end
   end
   
   function move_player()
    -- gravity=0.2 --bigger means more gravity!
    -- player.dx=gravity --add gravity
        
    --move left
    if (btnp(0)) then
     player.dx-=2
     sfx(0)
    end
    -- move right
    if (btnp(1)) then
        player.dx+=2
        sfx(0)
    end
        
    --move to new position
    player.x+=player.dx
    
    --update score
    player.score+=player.speed
   end
   
   function check_hit()
    for i=player.y,player.y+7 do
     if (cave[i+1].left>player.x 
      or cave[i+1].right<player.x+7) then
      game_over=true
      sfx(1)
     end
    end
   end

-->8
--cave creation

function make_cave()
    cave={{["left"]=10,["right"]=10}}
    left=50 --how low can the ceiling go?
    right=70 --how high can the floor get?
   end
   
   function update_cave()
    --remove the back of the cave
    if (#cave>player.speed) then
     for i=1,player.speed do
      del(cave,cave[1])
     end
    end
    
    --add more cave
    while (#cave<128) do
     local col={}
     local up=flr(rnd(0)+60)
     local dwn=flr(rnd(128)-60)
     col.left=mid(4,cave[#cave].left+up,left)
     col.right=mid(right,cave[#cave].right+dwn,124)
     add(cave,col)
    end
   end
   
   function draw_cave()
    left_color=5 --play with these!
    right_color=5 --choose your own colors!
    for i=1,#cave do
    --  line(i-1,0,i-1,cave[i].left,left_color)
    --  line(i-1,128,i-1,cave[i]right,right_color)
    line(0,i-1,40,cave[i].left)
    line(128,cave[i].right,90,128)
    end
   end


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000900900000000000090090000000000006000575000000000000000000000000000000000000000000000000000000000000000000000000000
00700700009999900999990000999990099999000066666005555000000000000000000000000000000000000000000000000000000000000000000000000000
00077000449fcfc00cfcf944449fcfc00cfcf944556717105dd66600000000000000000000000000000000000000000000000000000000000000000000000000
00077000a49ffff00ffff94aa49ffff00ffff94a756777700dd77600000000000000000000000000000000000000000000000000000000000000000000000000
007007004466666006666644446666600666664455ddddd00dd71600000000000000000000000000000000000000000000000000000000000000000000000000
000000000466666006666640046666611666664005ddddd00dd77600000000000000000000000000000000000000000000000000000000000000000000000000
0000000000100010010001000100000000000010005000505dd71660000000000000000000000000000000000000000000000000000000000000000000000000
