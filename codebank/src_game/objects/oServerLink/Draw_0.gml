/// @description Draw Debug Message
/// @author Toby Benjamin Clark
/// @date   16/01/2023

draw_set_font(fntTiny)
draw_set_alpha(0.6)
draw_text((room_width div 2) - 100, room_height - 25, global.left_hand);
draw_text((room_width div 2) + 100, room_height - 25, global.right_hand);
draw_set_alpha(1)