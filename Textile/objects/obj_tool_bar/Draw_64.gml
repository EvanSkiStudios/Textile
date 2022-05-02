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
toolbar_button_draw(button_select_all_options);
toolbar_button_draw(button_preset_S);
toolbar_button_draw(button_preset_L);
toolbar_button_draw(button_optifine_toggle);
toolbar_button_draw(button_optifine_download);
toolbar_button_draw(button_create_RP);
