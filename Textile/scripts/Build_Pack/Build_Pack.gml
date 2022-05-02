function Build_Pack(){
	
		var finished = false;
		var build_error = false;
	
		//do a while loop, because gms is single threaded so we lock the thread to only process the file transfers in the dll
		while(!finished){
			//set file paths
			export_location = (game_save_id + "Evanskis Chaos Pack Custom\\");
			export_location_ext = (game_save_id + "Evanskis Chaos Pack Custom\\assets\\minecraft\\");
	
			//get rid of old export if one exists
			if (directory_exists(export_location)){
				directory_destroy(export_location);	
			}
	
			resource_dir = (game_save_id+"Resources\\");
			if !(directory_exists(resource_dir)){
				show_error(("Unable to find Resources in :"+string(resource_dir)),true);	
			}
	
			//Add base
			better_directory_copy(resource_dir+"_Base", export_location);
	
			var array_len = array_length(global.options_array);
	
			for (var i = 0; i < array_len; ++i){
				if (global.options_array[i].settings.is_enabled){
					//sanatize option name
					var option_name = (global.options_array[i].str_name);
					option_name = string_replace(option_name,"\n"," ");
				
					//check conflicts
					/*
					if (global.options_array[i].settings.is_conflicted == true){
						show_message(
						"Warning! There are Conflicting Options\n"+
						option_name + " | " + global.options_array[i].conflicts[0]+
						"\n"+
						"Building will not continue until these are solved!"
						);
						build_error = true;
						break;
					}
					*/
				
					//get option files path
					var option_files = string((global.options_array[i].files[0]));
					show_debug_message(resource_dir+option_files);
			
					//copy files
					better_directory_copy(resource_dir+option_files, export_location_ext);
				}
			}
		
			//turns off the while loop to unlock the thread and allow us to continue
			finished = true;
		}
	
		if (build_error) return(-1); //their is an error
	
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