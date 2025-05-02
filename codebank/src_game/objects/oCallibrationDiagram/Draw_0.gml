/// @description Draw bullet points up to the current index

// Set the starting position for the text
var start_x = room_width div 10;
var start_y = y - 200;

draw_set_halign(fa_left);
draw_set_font(fntLevelNameSmall);

// Loop through each bullet point up to the current index and draw it
for (var i = 0; i <= current_index; i++) {
    draw_text(start_x, start_y + (i * 58), "- " + bullet_points[i]);
}
