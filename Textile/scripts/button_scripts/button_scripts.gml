function button_def_no_script(){show_debug_message("Blank Button Script Triggered!");}

function button_help_message(){
	show_message(
		"Textile (c) "+string(current_year)+" Evanski Studios"+"\n"+
		"https://github.com/EvanSkiStudios/Textile"
	);		
}

function button_preset_save(){
	show_debug_message("preset_save here");
}

function button_preset_load(){
	show_debug_message("preset_load here");
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
	
	export_location = (game_save_id + "Evanskis Chaos Pack\\");
	export_location_ext = (game_save_id + "Evanskis Chaos Pack\\assets\\minecraft\\");
	
	//get rid of old export if one exists
	if (directory_exists(export_location)){
		directory_destroy(export_location);	
	}
	
	resource_dir = (working_directory+"Resources\\");
	
	//Add base
	better_directory_copy(resource_dir+"_Base", export_location);
	
	
	//test
	better_directory_copy(resource_dir+"_datapack\\", export_location_ext);
	
	
	//Finish
	show_message("Pack created at:\n"+string(export_location));
	

/* alternitive? unproven if causes other errors / blows up on others pcs
	var old_working_dir = working_directory;
	
	var te = directory_set_current_working(game_save_id); show_message(te);
	
	var test = directory_copy(old_working_dir+"Resources\\_Base", game_save_id + "Evanskis Chaos Pack\\");
	show_message(test);
	*/
}
