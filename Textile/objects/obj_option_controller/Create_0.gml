//decative camera region
var cam;
cam = view_camera[0];
cam_y = camera_get_view_y(cam);
cam_y_last = -1000;

alarm_speed = (GAMESPEED) / 4;
alarm[0] = alarm_speed;

//create options array
create_global_options_array();

//create objects
var base_x = 96; var base_y = 128; var _depth = layer_get_depth(layer_get_id("Instances"));

var x_incr = 192; var y_incr = 224;

var shelf = -1; //where we are on the x
var row = 0; //where we are on the y

var array_len = array_length(global.options_array);
for (var i = 0; i < array_len; ++i){
	//get row interation
	shelf += 1;
	
	if (shelf = 5) row += 1;
	
	//calculate x cord
	_x = (base_x + (x_incr * shelf));
	_y = (base_y + (y_incr * row));
	
	if (_x > 864){
		_x = base_x; shelf = 0;
	}
	
	//DEBUG: show_message("x: "+string(_x)+"\n"+("y: "+string(_y)));
	
	//create and fill option
	var option_obj = instance_create_depth(_x,_y,_depth,obj_type_options);
	
	with(option_obj){
		var option_data = global.options_array[i];
		
		self_id =				option_obj;
		sprite_index =			option_data.icon;
		option_text_string =	option_data.str_name;
		option_enabled =		option_data.settings.is_enabled;
		option_is_conflicted =	option_data.settings.is_conflicted;
		is_optifine_option =	option_data.is_optifine;
		
		//add my instance id to the array
		global.options_array[i].my_id = self_id;
		
		//creation code
		array_index = option_data.index;
		
		icon = sprite_index;
		icon_index = image_index;
	}	
}
