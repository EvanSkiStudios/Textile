//draw background
draw_set_alpha(0.6);
draw_roundrect_color_ext(
	x - 80, y - 60,
	x + 80, y + 130,
	20,20,
	background_color_active, background_color_active,
	false
);
draw_set_alpha(1);

//draw background border
draw_roundrect_color_ext(
	x - 80, y - 60,
	x + 80, y + 130,
	20,20,
	$727272,$727272,
	true
);

//draw icon
draw_sprite_ext(icon, icon_index, x,y, 1, 1, 0, c_white, 1);

//draw icon border
icon_width = (sprite_get_width(icon));
icon_height = (sprite_get_height(icon));

draw_set_color($727272);
draw_rectangle(
	(x - (icon_width/2)),
	(y - (icon_height/2)),
	(x + (icon_width/2)),
	(y + (icon_height/2)),
	true
);
draw_set_color(c_black);

//draw text
draw_set_halign(fa_center);
draw_set_color(c_white);

draw_text(x, (y + (icon_height/2) + 10), option_text_string);

draw_set_color(c_black);
draw_set_halign(fa_left);