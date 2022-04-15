var _mouse_x = device_mouse_x(0);
var _mouse_y = device_mouse_y(0);

if (point_in_rectangle( _mouse_x, _mouse_y, x - 80, y - 60, x + 80, y + 130 )){
		
	if (window_get_cursor() != cr_handpoint) window_set_cursor(cr_handpoint);
		
	//if mouse is on button and has been clicked, run its script
	if (mouse_check_button_released(mb_left)){
		
		if (is_optifine_option){
			if !(global.settings_optifine_enabled){
				option_enabled = false;
				show_message("This option is disabled due to the Optifine setting being set to off!");
			}else{
				option_enabled = !option_enabled;
			}
		}else{
			option_enabled = !option_enabled;
		}
	}
}

if (is_optifine_option){
	if !(global.settings_optifine_enabled){
		option_enabled = false;
	}
}

//rectangle background color
if (option_enabled){
	background_color_active = background_color_enabled;	
}else{
	if !(is_conflicted){
		background_color_active = background_color_normal;	
	}else{
		background_color_active = background_color_conflict;		
	}
}

//option struct data
option = {
	name : option_text_string,
	is_enabled : option_enabled,
	conflicted : is_conflicted,
	files : ["Resources\\datapack"]
};
