
// Draw the empty loading bar (border)
draw_set_color(c_dkgrey);  // Set the border and the text to white
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, true);

draw_set_color(c_white);
// Calculate the width of the filled portion based on the progress
filled_width = (curr_time / loading_time) * bar_width;

// Draw the filled portion of the loading bar
draw_rectangle(bar_x, bar_y, bar_x + filled_width, bar_y + bar_height, false); 
draw_rectangle(bar_x + filled_width - 2, bar_y - 2, bar_x + filled_width + 2, bar_y + bar_height + 2, false);

// Draw the percentage text in white
draw_set_font(fntLevelNameTiny);
progress = (curr_time / loading_time) * 100;
draw_text(bar_x + filled_width - 5, bar_y - 35, string(floor(progress)) + "%");
