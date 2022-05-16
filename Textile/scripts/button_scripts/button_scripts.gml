function button_def_no_script(){show_debug_message("Blank Button Script Triggered!");}

function button_help_message(){
	show_message(
		"Textile (c) "+string(current_year)+" Evanski Studios"+"\n"+
		"https://github.com/EvanSkiStudios/Textile"
	);		
}

function button_select_all(){
	
	instance_activate_object(obj_type_options);
	
	with(obj_type_options){
		option_enabled = true;
		event_user(SET_OPTNS_SETS);
	}
	show_message("All options should be enabled")
}


function button_preset_save(){
	if (file_exists("preset.cfg")) file_delete("preset.cfg");
	
	var array_len = array_length(global.options_array);
	var save_array = array_create(array_len,false);
	
	for (var i = 0; i < array_len; ++i){
		if (global.options_array[i].settings.is_enabled){
			save_array[i] = true;
		}
	}
	
	var save_struct = {
		textile_ver : TEXTILE_VER,
		optifine_set : bool(global.settings_optifine_enabled),
		data : save_array	
	};
	
	var json_string = (json_stringify(save_struct));
	var buffer = buffer_create(string_length(json_string)+1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, json_string);
	buffer_save(buffer,"preset.cfg");
	buffer_delete(buffer);
	
	show_message("Preset Saved in:\n"+string(game_save_id));
}

function button_preset_load(){
	if !(file_exists(string(game_save_id)+"preset.cfg")){ show_message("No Preset file found, try saving one!"); return; }
	
	var save_file = buffer_load("preset.cfg");
	var json_string = buffer_read(save_file,buffer_string);
	buffer_delete(save_file);
	
	var game_struct = json_parse(json_string);
	
	var array_len = array_length(game_struct.data);

	for (var i = 0; i < array_len; ++i){
		var _bool = game_struct.data[i];
		global.options_array[i].settings.is_enabled = bool(_bool);
	}
	
	instance_activate_object(obj_type_options);
	//update objects
	with(obj_type_options){
		event_user(GET_OPTNS_SETS);
		event_user(SET_OPTNS_SETS);
	}
	
	//set optifine value
	if variable_struct_exists(game_struct,"optifine_set") global.settings_optifine_enabled = bool(game_struct.optifine_set);
	
	//get settings mismatch error handling
	if variable_struct_exists(game_struct,"textile_ver"){
		if (game_struct.textile_ver == TEXTILE_VER){
			//everything is okay
			show_message("Preset Loaded Successfully!");
		}else{
			//textile version doesnt match new version
			show_message("Preset Loaded"+"\n"+"WARNING! Your preset save is from a diffrent version of textile!"+"\n"+"Your settings may not have been loaded as intended!");
		}
	}else{
		//textile version info missing
		show_message("Preset Loaded"+"\n"+"WARNING! Your preset save is from an unknown version of textile!"+"\n"+"Your settings may not have been loaded as intended!");
	}
}

function button_toggle_optifine(){
	 if (global.settings_optifine_enabled){
		 
		global.settings_optifine_enabled = false;
		show_message("Optifine Options are now [OFF]");
		
	 }else{
		 
		global.settings_optifine_enabled = true;	 
		show_message(
			"Optifine Options are now [ON]"+"\n"+
			"Please note: \n"+
			"These settings in Optifine are required for the Optifine Effects to work"+"\n"+
			"Navigate to Options/Video settings/Quality"+"\n"+
			"Custom Fonts: On"+"\n"+
			"Custom Entity Models: On"+"\n"+
			"Random Entities: On"+"\n"+
			"Custom Colors: On"+"\n"+
			"Custom Items: On"+"\n"+
			"Custom GUIs: On"
		);	
	 }
}

function button_download_optifine(){
	url_open("https://optifine.net/downloads");	
}

function button_create_resourcepack(){
	Build_Pack();
}
