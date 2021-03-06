//option_enabled = global.options_array[array_index].settings.is_enabled;
//option_is_conflicted = global.options_array[array_index].settings.is_conflicted;

var _mouse_x = device_mouse_x(0);
var _mouse_y = device_mouse_y(0);

//if not on toolbar but on option fire code
if !(global.click_through_turnoff){
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
					event_user(SET_OPTNS_SETS);
					check_conflicts_on_togl_enable();
				}
			}else{
				option_enabled = !option_enabled;
				event_user(SET_OPTNS_SETS);
				check_conflicts_on_togl_enable();
			}
		}
	}
}

//sync
if (option_enabled){
	if (global.options_array[array_index].settings.is_enabled){	
		check_conflicts_on_togl_enable();
	}else{
		event_user(GET_OPTNS_SETS);
	}
}else{
	if !(global.options_array[array_index].settings.is_enabled){	
		check_conflicts_on_togl_enable();
	}else{
		event_user(GET_OPTNS_SETS);
	}		
}


if (is_optifine_option){
	if !(global.settings_optifine_enabled){
		option_enabled = false;
		event_user(SET_OPTNS_SETS);
	}
}

//rectangle background color
if (option_enabled){
	if (option_is_conflicted){
		background_color_active = background_color_conflict;
	}else{
		background_color_active = background_color_enabled;	
	}
}else{
	background_color_active = background_color_normal;	
}
