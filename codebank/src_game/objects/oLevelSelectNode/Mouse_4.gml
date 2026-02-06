if (is_undefined(node)) exit;

// Decide behavior:
// - If it's a single planet (level folder), you'd typically start the level here.
// - For now, we navigate into it anyway (as requested: “one level at a time”).
level_select_open_node(controller, node);
