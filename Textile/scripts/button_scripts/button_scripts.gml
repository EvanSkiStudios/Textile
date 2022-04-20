function button_def_no_script(){show_debug_message("Blank Button Script Triggered!");}

function button_help_message(){
	show_message(
		"Textile (c) "+string(current_year)+" Evanski Studios"+"\n"+
		"https://github.com/EvanSkiStudios/Textile"
	);		
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
		textile_ver : global.textile_ver,
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
	
	//set optifine value
	if variable_struct_exists(game_struct,"optifine_set") global.settings_optifine_enabled = bool(game_struct.optifine_set);
	
	//get settings mismatch error handling
	if variable_struct_exists(game_struct,"textile_ver"){
		if (game_struct.textile_ver == global.textile_ver){
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
	var finished = false;
	
	//do a while loop, because gms is single threaded so we lock the thread to only process the file transfers in the dll
	while(!finished){
		//set file paths
		export_location = (game_save_id + "Evanskis Chaos Pack Custom\\");
		export_location_ext = (game_save_id + "Evanskis Chaos Pack Custom\\assets\\minecraft\\");
	
		//get rid of old export if one exists
		if (directory_exists(export_location)){
			directory_destroy(export_location);	
		}
	
		resource_dir = (working_directory+"Resources\\");
	
		//Add base
		better_directory_copy(resource_dir+"_Base", export_location);
	
		var array_len = array_length(global.options_array);
	
		for (var i = 0; i < array_len; ++i){
			if (global.options_array[i].settings.is_enabled){
				//sanatize option name
				var option_name = (global.options_array[i].str_name);
				option_name = string_replace(option_name,"\n"," ");
			
				//get option files path
				var option_files = string((global.options_array[i].files[0]));
				show_debug_message(option_files);
			
				//copy files
				better_directory_copy(resource_dir+option_files, export_location_ext);
			}
		}
		
		//turns off the while loop to unlock the thread and allow us to continue
		finished = true;
	}
	
	//Finish
	show_message("Pack created at:\n"+string(export_location));
	show_debug_message("Pack created at:\n"+string(export_location));
	
	

/* alternitive? unproven if causes other errors / blows up on others pcs
	var old_working_dir = working_directory;
	
	var te = directory_set_current_working(game_save_id); show_message(te);
	
	var test = directory_copy(old_working_dir+"Resources\\_Base", game_save_id + "Evanskis Chaos Pack\\");
	show_message(test);
	*/
}
