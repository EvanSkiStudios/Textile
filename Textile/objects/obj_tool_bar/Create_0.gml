display_width = display_get_gui_width();
toolbar_height = 25;

mouse_alarm_reset_speed = (GAMESPEED / 16);
alarm[0] = mouse_alarm_reset_speed;


global.toolbar_buttons = 0;
function toolbar_button(button_sprite=spr_toolbar_button,button_text="", button_execute) constructor{
	
	//set button num
	var _button_num = global.toolbar_buttons;
	
	var button_base_x = 5;
	var button_base_y = 3;
	var button_base_w = 136;
	var button_base_h = 20;
	
	var button_seperator = 20;
	
	if (_button_num != 0){
		//draw next button with x differance so its next to the last button
		var button_x = ( (button_base_x + ( (button_base_w + button_seperator) * _button_num) ) );
	}else{
		//else this is the first button so set it to the base x
		var button_x = (button_base_x);
	}
	
	//increase button number
	global.toolbar_buttons += 1;
	
	//create struct to referance button values later
	button = {
		num : _button_num,
		_x : button_x,
		_y : button_base_y,
		_w : button_base_w,
		_h : button_base_h,
		_sprite : button_sprite,
		_text : button_text,
		_execute : button_execute
	}
	
	return(button);
}

//update dynamic things with buttons
function toolbar_update_button(_button){
	switch(_button.button._execute){
		default: break;	
		
		case (button_toggle_optifine):{
			
			if (global.settings_optifine_enabled){
				_button.button._text = "Optifine [ON]";
			}else{
				_button.button._text = "Optifine [OFF]";
			}
		}break;
		
	}
}


function toolbar_check_activated(_button){
	if (instance_exists(obj_par_disable_toolbar_buttons)) exit;
	
	//get if mouse is over button and react accordingly
	xx = _button.button._x; 
	yy = _button.button._y;
	ww = _button.button._w;
	hh = _button.button._h;
	_script = _button.button._execute;
	
	var _mouse_x = device_mouse_x(0);
	var _mouse_y = device_mouse_y(0);
	
	if (point_in_rectangle( _mouse_x, _mouse_y, xx, yy + global.camera_y_pos, (ww+xx), (hh+yy) + global.camera_y_pos )){
		
		//prevents accidental selection when building
		global.click_through_turnoff = true;
		alarm[1] = (GAMESPEED * 0.5);
		
		_button.button._sprite = spr_toolbar_button_act;
		if (window_get_cursor() != cr_handpoint) window_set_cursor(cr_handpoint);
		
		//if mouse is on button and has been clicked, run its script
		if (mouse_check_button_released(mb_left)){
			script_execute(_script);
		}
		
	}else{
		if (_button.button._sprite != spr_toolbar_button) _button.button._sprite = spr_toolbar_button;
	}
	
}

function toolbar_button_draw(_button){
	if (instance_exists(obj_par_disable_toolbar_buttons)) exit;
	
	//get value from struct from the funtion that made the button
	xx = _button.button._x; 
	yy = _button.button._y;
	ww = _button.button._w;
	hh = _button.button._h;
	spr = _button.button._sprite;
	text = _button.button._text;
	
	//draw button
	draw_sprite_stretched(spr,0, xx,yy,ww,hh);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_toolbar);
	draw_set_color(c_white);
	
	draw_text(
		xx + (ww/2), 
		yy + (hh/2),
		text
	);
	
	draw_set_color(c_black);
	draw_set_font(-1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}


//Create buttons
//button_help =				new toolbar_button(, "About",				button_help_message);
button_select_all_options =	new toolbar_button(, "Select all",			button_select_all);
button_preset_S =			new toolbar_button(, "Save Preset",			button_preset_save);
button_preset_L =			new toolbar_button(, "Load Preset",			button_preset_load);
button_optifine_toggle =	new toolbar_button(, "Toggle Optifine",		button_toggle_optifine);
button_optifine_download =	new toolbar_button(, "Download Optifine",	button_download_optifine);
button_create_RP =			new toolbar_button(, "Build Pack",			button_create_resourcepack);
button_create_zip =			new toolbar_button(, "Auto-Zip",			button_help_message);
