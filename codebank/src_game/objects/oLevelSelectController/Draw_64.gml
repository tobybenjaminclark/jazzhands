draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (!is_undefined(current_node)) {
    draw_text(room_width * 0.5, 30, "CUSTOM SPACE MAP: " + current_node.name);
    draw_text(room_width * 0.5, 55, "Click squares/circles to navigate • ESC to go back");
}
