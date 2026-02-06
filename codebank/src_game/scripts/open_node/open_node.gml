/// @func level_select_open_node(controller, node)
function level_select_open_node(controller, node) {
    with (controller) {
        if (is_undefined(node)) exit;

        // Push current to stack
        if (!is_undefined(current_node)) array_push(nav_stack, current_node);

        current_node = node;
        spawn_children_for(current_node);
    }
}
