// Build tree once
root_node = build_tree(CUSTOM_LEVEL_DIRECTORY);
if (is_undefined(root_node)) {
    show_debug_message("No custom levels found under: " + CUSTOM_LEVEL_DIRECTORY);
}

// Navigation stack holds node refs
nav_stack = [];

// Start at root
current_node = root_node;

// UI list of spawned buttons
spawned = [];

/// local function to clear spawned UI nodes
function clear_spawned() {
    for (var i = 0; i < array_length(spawned); i++) {
        if (instance_exists(spawned[i])) instance_destroy(spawned[i]);
    }
    spawned = [];
}

/// local function to spawn UI nodes for current folder
function spawn_children_for(node) {
    clear_spawned();

    if (is_undefined(node)) return;

    var kids = node.children;
    var n = array_length(kids);
    if (n <= 0) return;

    var cx = room_width * 0.5;
    var cy = room_height * 0.55;

    // Layout on a ring
    var ring = min(room_width, room_height) * 0.28;

    for (var i = 0; i < n; i++) {
        var a = (i / n) * 2 * pi - pi * 0.5;
        var _x = cx + lengthdir_x(ring, radtodeg(a));
        var _y = cy + lengthdir_y(ring, radtodeg(a));

        var inst = instance_create_layer(_x, _y, "Instances", oLevelSelectNode);
        inst.node = kids[i];
        inst.controller = id;

        array_push(spawned, inst);
    }
}

// spawn initial view
spawn_children_for(current_node);
