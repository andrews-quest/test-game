draw_set_halign(fa_left);
draw_set_valign(fa_top);

if(instance_exists(obj_player))
{
draw_text(0, 0, "Speed\nX:" + string(obj_player.xspd + obj_player.xinert) + "\nY:" + string(obj_player.yspd + obj_player.yinert));
}