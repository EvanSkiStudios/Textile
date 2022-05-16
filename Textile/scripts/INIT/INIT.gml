if (debug_mode) show_debug_overlay(true);

#macro GAMESPEED game_get_speed(gamespeed_fps)


#macro TEXTILE_VER 140

global.camera_y_pos = 0;
global.settings_optifine_enabled = true;
global.click_through_turnoff = false;

global.options_index = ds_list_create();

#macro SET_OPTNS_SETS 0
#macro GET_OPTNS_SETS 1


function options_set_and_reload(){
	//sets the array then updates objects
	with(obj_type_options){
		event_user(SET_OPTNS_SETS);
		event_user(GET_OPTNS_SETS);
	}	
}

function options_get_and_reload(){
	//updates objects then sets the array
	with(obj_type_options){
		event_user(GET_OPTNS_SETS);
		event_user(SET_OPTNS_SETS);
	}	
}


#region//USE THESE INSTEAD OF THE DLL ONES TO ADVOID WEIRD WINDOWS THIGNS
	function get_directory_contents(dname, pattern, includedirs, recursive) {
		var i = 0; var result = undefined; 
		var tmp = directory_contents_first(dname, pattern, includedirs, recursive);
		while (tmp != "") {
		    result[i] = tmp; i++;
		    tmp = directory_contents_next();
		}
		directory_contents_close();
		return result;
	}


	function better_directory_copy(dname, newname) {
	    var better = get_directory_contents(dname, "*.*", true, true);
	    if (is_undefined(better)) show_error("ERROR GETTING DIRECTORY CONTENTS!", true);
    
	    for (var i = 0; i < array_length(better); i++) {
	        if (file_exists(better[i])) {
	            file_copy(better[i], newname + "/" + string_replace(filename_path(better[i]), dname, "") + filename_name(better[i]));
	        } else if (symlink_exists(better[i])) {
	            symlink_copy(better[i], newname + "/" + string_replace(filename_path(better[i]), dname, "") + filename_name(better[i]));
	        } else if (directory_exists(better[i])) {
	            directory_create(newname + "/" + string_replace(filename_path(better[i]), dname, ""));
	        }
	    }
	}
#endregion
