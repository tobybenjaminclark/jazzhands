level_name = "";
grid_x = 0;
grid_y = 0;

base_x = 0;
base_y = 0;

// neighbors
n_left  = noone;
n_right = noone;
n_up    = noone;
n_down  = noone;

is_selected = false;

// selector pulse
sel_t = irandom(1000000);   // desync stars a bit
sel_base = 1.0;             // base scale
sel_amp  = 0.12;            // how much it grows/shrinks
sel_spd  = 0.08;            // speed of pulse (radians per step)