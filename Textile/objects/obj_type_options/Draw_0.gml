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

if (is_optifine_option){
	if !(global.settings_optifine_enabled){
		shader_set(shd_greyscale);		
	}
}

//draw icon
icon_index = image_index;
draw_sprite_ext(icon, icon_index, x,y, 1, 1, 0, c_white, 1);

shader_reset();

//draw icon border
icon_width = (sprite_get_width(icon));
icon_height = (sprite_get_height(icon));

draw_set_color($727272);
draw_rectangle(
	(x - (icon_width/2)),
	(y - (icon_height/2)),
	(x + (icon_width/2) - 1),
	(y + (icon_height/2) - 1),
	true
);
draw_set_color(c_black);

//draw text
draw_set_halign(fa_center);
draw_set_color(c_white);

draw_text(x, (y + (icon_height/2) + 10), option_text_string);

if (option_is_conflicted){
	draw_set_font(fnt_conflict);
	
	draw_text(x, (y + (icon_height/2) + 50), "Conflicted with\n"+(global.options_array[array_index].conflicts[0]));	
	
	draw_set_font(-1);
}

draw_set_color(c_black);
draw_set_halign(fa_left);
