xspd = 0;
yspd = 0;
current_xspd = 0;
current_yspd = 0;

move_spd = 1;
spd_max = 1.8;
spd_min = 1;

xinert = 0;
yinert = 0;

time_animation_started = 0;
time_now = 0;

moving_now = false;
moving_was = false;

sprite[RIGHT] = spr_player_right;
sprite[LEFT] = spr_player_left;
sprite[IDLE] = spr_player_idle;

face = IDLE;