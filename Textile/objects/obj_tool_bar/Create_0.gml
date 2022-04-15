display_width = display_get_gui_width();
toolbar_height = 25;

global.toolbar_buttons = 0;
function toolbar_button(button_text="", button_execute) constructor{
	
	//set button num
	var _button_num = global.toolbar_buttons;
	
	var button_base_x = 5;
	var button_base_y = 3;
	var button_base_w = 80;
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
		_text : button_text,
		_execute : button_execute
	}
	
	return(button);
}


function toolbar_button_draw(_button){
	//get value from struct from the funtion that made the button
	xx = _button.button._x; 
	yy = _button.button._y;
	ww = _button.button._w;
	hh = _button.button._h;
	text = _button.button._text;
	
	//draw button
	draw_sprite_stretched(spr_toolbar_button,0, xx,yy,ww,hh);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fnt_toolbar);
	draw_text(
		xx + (ww/2), 
		yy + (hh/2),
		text
	);
	draw_set_font(-1);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
}


//button
first_button = new toolbar_button("Help",button_def_no_script);
sec_button = new toolbar_button("Preset",button_def_no_script);
