right_key = keyboard_check(vk_right);
left_key = keyboard_check(vk_left);
up_key = keyboard_check(vk_up);
down_key = keyboard_check(vk_down);

mask_index = sprite[IDLE];

xspd = (right_key - left_key) * move_spd;
yspd = (down_key - up_key) * move_spd;

//collisions
if(place_meeting(x + xspd, y, obj_wall) == true){
	xspd = 0;
	xinert = 0;
}

if(place_meeting(x, y + yspd, obj_wall) == true){
	yspd = 0;
	yinert = 0;
}

//move the player
x += xspd + xinert;
y += yspd + yinert;

//
//inertia
//

//change the status of movement
if(xspd != 0 || yspd != 0){
	moving_now = true;
	current_xspd = xspd;
	current_yspd = yspd;
}else{
	moving_now = false;
}

//time of movement's start or end
if(moving_now != moving_was){
	time_animation_started = current_time;
	moving_was = moving_now;
	xinert = current_xspd;
	yinert = current_yspd;
	current_xspd = 0;
	current_yspd = 0;
}

//apply inertia
time_now = current_time;
if( time_now - time_animation_started >= 100){	
	if(moving_now && move_spd <= spd_max){
		move_spd += 0.1;
		time_animation_started = current_time;
	}
}

if( time_now - time_animation_started >= 5){	
	if(!moving_now && xinert != 0 || yinert != 0){
			move_spd = spd_min;

			if(xinert > 0){
				xinert -= 0.1;
			}
			if(xinert < 0){
				xinert += 0.1;
			}
		
			if(yinert > 0){
				yinert -= 0.1;
			}
			if(xinert < 0){
				xinert += 0.1;
			}
		
			time_animation_started = current_time;
	}
}

//set sprite
if xspd > 0 {face = RIGHT};
if xspd < 0 {face = LEFT};

if (xspd == 0 && yspd == 0){
	face = IDLE;
	audio_stop_sound(snd_footsteps);
}else{
	audio_play_sound(snd_footsteps, 0, true);
}

sprite_index = sprite[face];

//depth
depth = -bbox_bottom;