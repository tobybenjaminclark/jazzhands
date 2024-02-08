/// @description Handles Debug Drawing
/// @author Toby Benjamin Clark
/// @date   14/01/2023

draw_line(0, kill_line, room_width, kill_line);
draw_text(x, y, string(paused_time) + "::" + string(unpaused_time) + " -> " + string(paused_time - unpaused_time));
draw_text(x, y+20, string(level_score));






