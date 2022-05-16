draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_font(fnt_loading);

var loading_text_first = ("LOADING");
var loading_text = (+"\n"+"Unpacking Resources...");

draw_text(room_width/2, (room_height/2 - string_height(loading_text_first)), loading_text_first+loading_text);

draw_set_halign(fa_left);
draw_set_font(-1);
draw_set_color(c_black);
