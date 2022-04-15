//base toolbar box
draw_sprite_stretched(
	spr_toolbar,0,
	0,0,
	display_width, toolbar_height
);

//toolbar outline
draw_sprite_stretched(
	spr_toolbar_alt,0,
	0,toolbar_height,
	display_width, 2
);


//draw_buttons
toolbar_button_draw(first_button);
toolbar_button_draw(sec_button);
