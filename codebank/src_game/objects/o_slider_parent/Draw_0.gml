/// @description Draw the slider
draw_self();
draw_sprite_part(sprite_index, 1, 0, 0, sprite_width*value_*image_xscale, sprite_height, x, y-sprite_get_yoffset(sprite_index));
draw_sprite(s_slider_button, 0, x+sprite_width*value_, y);

draw_set_font(fntLevelNameTiny);
draw_set_halign(fa_right);
draw_text(x + sprite_width , y - 50, round(value_ * 100));

draw_set_halign(fa_left);
draw_text(x, y - 50, label);