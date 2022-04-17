function create_option(_index,_name,_icon,_files,_optifine=false,_sound=false,_sound_file=""){
	//option struct data
	option = {
		index : _index,
		icon : _icon,
		str_name : _name,
		files : _files,
		is_optifine : _optifine,
		is_sound : _sound,
		sound_file : _sound_file,
		
		//settings for option object
		settings : {
			is_enabled : false,
			is_conflicted : false
		}
	};
	
	//returns built struct
	return(option);
}

//set array
var i = 0;
global.options_array[i] =	create_option(i,"Datapack Assets",spr_datapack,["_datapack\\"],true);
global.options_array[++i] = create_option(i,"Plugin Assets",spr_plugin_assets,["_plugin\\"],true);
global.options_array[++i] = create_option(i,"Optifine Colors"+"\n"+"Helper",spr_opt_color_helper,["_Optifine options\\optifine colors helper\\"],true);
global.options_array[++i] = create_option(i,"Datapack Assets",spr_datapack,["_Optifine options\\datapack\\"],true);
global.options_array[++i] = create_option(i,"Datapack Assets",spr_datapack,["_Optifine options\\datapack\\"],true);
global.options_array[++i] = create_option(i,"Datapack Assets",spr_datapack,["_Optifine options\\datapack\\"],true);
global.options_array[++i] = create_option(i,"Datapack Assets",spr_datapack,["_Optifine options\\datapack\\"],true);
global.options_array[++i] = create_option(i,"Datapack Assets",spr_datapack,["_Optifine options\\datapack\\"],true);
global.options_array[++i] = create_option(i,"Datapack Assets",spr_datapack,["_Optifine options\\datapack\\"],true);
global.options_array[++i] = create_option(i,"Datapack Assets",spr_datapack,["_Optifine options\\datapack\\"],true);
global.options_array[++i] = create_option(i,"Datapack Assets",spr_datapack,["_Optifine options\\datapack\\"],true);


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
		
		sprite_index =			option_data.icon;
		option_text_string =	option_data.str_name;
		option_enabled =		option_data.settings.is_enabled;
		option_is_conflicted =	option_data.settings.is_conflicted;
		is_optifine_option =	option_data.is_optifine;
		is_sound =				option_data.is_sound;
		sound_file =			option_data.sound_file;
		
		
		//creation code
		array_index = option_data.index;
		
		icon = sprite_index;
		icon_index = image_index;
		
		if (is_sound){
			//snd = audio_create_stream("Music/Track1.ogg");
			snd = audio_create_stream(sound_file);
		}
	}
	
}
