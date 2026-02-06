// Back navigation (ESC)
if (keyboard_check_pressed(vk_escape)) {
    if (array_length(nav_stack) > 0) {
        current_node = nav_stack[array_length(nav_stack) - 1];
        array_pop(nav_stack);
        // respawn view
        spawn_children_for(current_node);
    }
}
