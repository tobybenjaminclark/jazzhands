// oLevelBrowser : Draw (or Draw End)
// (make sure your stars are already positioned via _apply_offset_to_all)

if (is_undefined(selected) || selected == noone || !instance_exists(selected)) exit;

// style
draw_set_color(c_white);

var drawn = ds_map_create();

// ----- ring 1: selected -> direct neighbours (alpha 1.0)
var s = selected;

var n1 = array_create(0);
array_push(n1, s.n_left);
array_push(n1, s.n_right);
array_push(n1, s.n_up);
array_push(n1, s.n_down);

for (var i = 0; i < array_length(n1); i++) {
    var a = n1[i];
    _draw_edge_once(drawn, s, a, 1.0);
}

// ----- ring 2: neighbours -> their neighbours (alpha 0.5)
for (var i = 0; i < array_length(n1); i++) {
    var a = n1[i];
    if (a == noone || !instance_exists(a)) continue;

    // a's neighbours
    var nb = array_create(0);
    array_push(nb, a.n_left);
    array_push(nb, a.n_right);
    array_push(nb, a.n_up);
    array_push(nb, a.n_down);

    for (var j = 0; j < array_length(nb); j++) {
        var b = nb[j];
        if (b == noone || !instance_exists(b)) continue;
        if (b == s) continue; // don't redraw ring1 as ring2
        _draw_edge_once(drawn, a, b, 0.5);
    }
}

// ----- selected -> diagonals (alpha 0.5)
// diagonals in your (grid_x, grid_y) space: (+/-1, +/-1)
if (ds_exists(pos_map, ds_type_map)) {
    var dx = array_create(4, 0);
    var dy = array_create(4, 0);

    dx[0] = -1; dy[0] = -1;
    dx[1] =  1; dy[1] = -1;
    dx[2] = -1; dy[2] =  1;
    dx[3] =  1; dy[3] =  1;

    for (var k = 0; k < 4; k++) {
        var d = _map_get_or_noone(pos_map, _key(s.grid_x + dx[k], s.grid_y + dy[k]));
        _draw_edge_once(drawn, s, d, 0.5);
    }
}

// reset + cleanup
draw_set_alpha(1);
ds_map_destroy(drawn);