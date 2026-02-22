
function _key(_gx, _gy) {
    return string(_gx) + "," + string(_gy);
}

// Generate spiral lattice coordinates for index i (0-based)
function _spiral_coord(_i) {
    var _x = 0, _y = 0;
    if (_i == 0) return [0, 0];

    var n = 0;
    var step = 1;
    var dir = 0; // 0=right,1=up,2=left,3=down

    // Walk until we’ve done _i steps
    while (n < _i) {
        // each step size repeats twice: 1,1,2,2,3,3,...
        for (var rep = 0; rep < 2; rep++) {
            for (var s = 0; s < step; s++) {
                if (n >= _i) break;

                switch (dir) {
                    case 0: _x += 1; break; // right
                    case 1: _y -= 1; break; // up (screen coords)
                    case 2: _x -= 1; break; // left
                    case 3: _y += 1; break; // down
                }
                n += 1;
                if (n == _i) return [_x, _y];
            }
            dir = (dir + 1) mod 4;
        }
        step += 1;
    }

    return [_x, _y];
}

function _edge_key(_a, _b) {
    // avoid duplicate lines (A,B) vs (B,A)
    var ia = _a.id;
    var ib = _b.id;
    if (ia < ib) return string(ia) + "|" + string(ib);
    else         return string(ib) + "|" + string(ia);
}

function _draw_edge_once(_drawn_map, _a, _b, _alpha) {
    if (_a == noone || _b == noone) return;
    if (!instance_exists(_a) || !instance_exists(_b)) return;

    var k = _edge_key(_a, _b);
    if (ds_map_exists(_drawn_map, k)) return;
    ds_map_add(_drawn_map, k, 1);

    draw_set_alpha(_alpha);
    draw_line_width(_a.x, _a.y, _b.x, _b.y, 2);
}

function _build_from_names(_names_array) {
    // map from "x,y" -> star instance
    pos_map = ds_map_create();

    var count = array_length(_names_array);
    array_resize(stars, count);

    // 1) create stars and place them
    for (var i = 0; i < count; i++) {
        var p = _spiral_coord(i);
        var gx = p[0];
        var gy = p[1];

        var inst = instance_create_layer(0, 0, "Instances", oStar);
        inst.level_name = _names_array[i];
        inst.grid_x = gx;
        inst.grid_y = gy;

		inst.base_x = (gx + 0.5 * (gy & 1)) * cell;
		inst.base_y = gy * (cell * 0.8660254);

        stars[i] = inst;

        ds_map_add(pos_map, _key(gx, gy), inst);
    }

    // 2) link neighbors (4-way)
	for (var i = 0; i < count; i++) {
	    var s = stars[i];

	    s.n_left  = _map_get_or_noone(pos_map, _key(s.grid_x - 1, s.grid_y));
	    s.n_right = _map_get_or_noone(pos_map, _key(s.grid_x + 1, s.grid_y));
	    s.n_up    = _map_get_or_noone(pos_map, _key(s.grid_x,     s.grid_y - 1));
	    s.n_down  = _map_get_or_noone(pos_map, _key(s.grid_x,     s.grid_y + 1));
	}
}	

function _apply_offset_to_all() {

    var cx = room_width * 0.5;
    var cy = room_height * 0.5;

    for (var i = 0; i < array_length(stars); i++) {
        var s = stars[i];
        s.x = cx + s.base_x + view_off_x;
        s.y = cy + s.base_y + view_off_y;
    }
}

function _select(_new) {
    if (is_undefined(_new)) return;
    if (_new == noone) return;
    if (!instance_exists(_new)) return;

    if (!is_undefined(selected) && selected != noone && instance_exists(selected)) {
        selected.is_selected = false;
    }

    selected = _new;
    selected.is_selected = true;

    target_off_x = -selected.base_x;
    target_off_y = -selected.base_y;
}

function _map_get_or_noone(_map, _k) {
    if (!ds_map_exists(_map, _k)) return noone;
    var v = ds_map_find_value(_map, _k);
    return is_undefined(v) ? noone : v;
}

function _center_constellation() {

    var count = array_length(stars);
    if (count == 0) return;

    var minx = stars[0].base_x;
    var maxx = stars[0].base_x;
    var miny = stars[0].base_y;
    var maxy = stars[0].base_y;

    for (var i = 1; i < count; i++) {
        var s = stars[i];

        if (!instance_exists(s)) continue;

        minx = min(minx, s.base_x);
        maxx = max(maxx, s.base_x);
        miny = min(miny, s.base_y);
        maxy = max(maxy, s.base_y);
    }

    var cx_base = (minx + maxx) * 0.5;
    var cy_base = (miny + maxy) * 0.5;

    view_off_x = -cx_base;
    view_off_y = -cy_base;

    target_off_x = view_off_x;
    target_off_y = view_off_y;

    _apply_offset_to_all();
}

// --- config ---
cell = 650;          // spacing between lattice points
pan_speed = 0.18;   // smoothing 0..1 (higher = snappier)

// world offset (we move stars by this; camera stays put)
view_off_x = 0;
view_off_y = 0;
target_off_x = 0;
target_off_y = 0;

// build
stars = []; // array of instance ids
// In oLevelBrowser Create (or wherever you build the lattice)
var worlds_list = scan_worlds();

// Convert ds_list -> array
var n = ds_list_size(worlds_list);
var worlds_arr = array_create(n);

for (var i = 0; i < n; i++) {
    worlds_arr[i] = worlds_list[| i];
}

// Build stars from names
_build_from_names(worlds_arr);

// Cleanup the ds_list you created in scan_worlds()
ds_list_destroy(worlds_list);

selected = stars[0];
selected.is_selected = true;

_center_constellation(); // calls _apply_offset_to_all()