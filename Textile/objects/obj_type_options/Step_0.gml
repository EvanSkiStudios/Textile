var _mouse_x = device_mouse_x(0);
var _mouse_y = device_mouse_y(0);
	
if (point_in_rectangle( _mouse_x, _mouse_y, x - 80, y - 60, x + 80, y + 130 )){
		
	if (window_get_cursor() != cr_handpoint) window_set_cursor(cr_handpoint);
		
	//if mouse is on button and has been clicked, run its script
	if (mouse_check_button_released(mb_left)){
		enabled = !enabled;
	}
}

//rectangle background color
if (enabled){
	background_color_active = background_color_enabled;	
}else{
	if !(is_conflicted){
		background_color_active = background_color_normal;	
	}else{
		background_color_active = background_color_conflict;		
	}
}
