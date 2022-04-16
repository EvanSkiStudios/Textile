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
	
	//get rid of old export if one exists
	if (directory_exists(game_save_id + "Evanskis Chaos Pack\\")){
		directory_destroy(game_save_id + "Evanskis Chaos Pack\\");	
	}
	
	var test = better_directory_copy(working_directory+"Resources\\_Base", game_save_id + "Evanskis Chaos Pack\\");
	show_message(test);
	

/* alternitive? unproven if causes other errors / blows up on others pcs
	if !(directory_exists("C:\\Users\\Evan\\Documents\\My Games\\" + "test\\")){
		directory_create("C:\\Users\\Evan\\Documents\\My Games\\" + "test\\");	
	}
	
	var old_working_dir = working_directory;
	
	var te = directory_set_current_working(game_save_id); show_message(te);
	
	var test = directory_copy(old_working_dir+"Resources\\_Base", game_save_id + "Evanskis Chaos Pack\\");
	show_message(test);
	*/
}
