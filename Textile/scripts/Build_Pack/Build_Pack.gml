function Build_Pack(){
	
		var build_error = 0;
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
					var conflicters = check_conflicts_on_build(i);
					
					//we have conflicts
					if (conflicters[0] != 0){
						var warning_string = (
						"WARNNING!!!"+"\n"+"\n"+
						string(option_name)+"\n"+"\n"+
						"Is conflicted with"+"\n"+"\n"+
						conflicters[1]+"\n"+"\n"+
						"Build Process will now stop!"
						);
						
						show_message(warning_string);
						
						//Overwrite options menu here
						
						build_error = 1;
						show_debug_message("Build Pack Exited with status: "+string(build_error));	
						break;
					}
					//get option files path
					var option_files = string((global.options_array[i].files[0]));
					show_debug_message(resource_dir+option_files);
			
					//copy files
					if (option_files == ("_datapack\\")){
						better_directory_copy(resource_dir+option_files, (game_save_id + "Evanskis Chaos Pack Custom\\"));
					}else{
					
						better_directory_copy(resource_dir+option_files, export_location_ext);
					}
				}
			}
		
			//turns off the while loop to unlock the thread and allow us to continue
			show_debug_message("Build Pack Exited with status: "+string(build_error));	
			finished = true;
		}
	
		if (build_error) return(-1); //their is an error
	
		//Finish
		show_message("Pack created at:\n"+string(export_location));
		show_debug_message("Pack created at:\n"+string(export_location));
}