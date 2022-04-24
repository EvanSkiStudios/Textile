#macro GAMESPEED game_get_speed(gamespeed_fps)


global.textile_ver = 120;

global.camera_y_pos = 0;
global.settings_optifine_enabled = true;
global.click_through_turnoff = false;

global.options_index = ds_list_create();

//for type options
function check_conflicts(){
	if (option_enabled){
		if (array_length((global.options_array[array_index].conflicts)) > 0){
			var conflictor = global.options_array[array_index].conflicts[0];
			var option = ds_list_find_index(global.options_index, conflictor);
			if (global.options_array[option].settings.is_enabled){
				option_is_conflicted = true;
				global.options_array[option].settings.is_conflicted = true;
			}else{
				//conflicting options are not enabled
				option_is_conflicted = false;	
				global.options_array[array_index].settings.is_conflicted = false;
				global.options_array[option].settings.is_conflicted = false;
			}
		}
	}else{
		//we are not enabled
		option_is_conflicted = false;	
		global.options_array[array_index].settings.is_conflicted = false;
		
		var conflictor = global.options_array[array_index].conflicts[0];
		var option = ds_list_find_index(global.options_index, conflictor);
		global.options_array[option].settings.is_conflicted = false;
	}
}


//USE THESE INSTEAD OF THE DLL ONES TO ADVOID WEIRD WINDOWS THIGNS
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

