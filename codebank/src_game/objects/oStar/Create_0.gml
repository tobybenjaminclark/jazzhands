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

// star render
phase = random(1000);   // per-star time offset

// global tint per star (very subtle)
star_hue = random(360);
star_seed = irandom(1000000);

// controls for how colourful it can get
star_hue_range = 18;          // degrees (+/-). try 10..30
star_sat_base  = 0.10;        // 0..1 (small)
star_sat_range = 0.06;        // 0..1 (small)