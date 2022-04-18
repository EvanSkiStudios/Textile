#macro GAMESPEED game_get_speed(gamespeed_fps)

global.camera_y_pos = 0;
global.settings_optifine_enabled = true;


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
	        file_copy(better[i], newname + "/" + string_replace(filename_dir(better[i]), dname, "") + "/" + filename_name(better[i]));
	    } else if (symlink_exists(better[i])) {
	        symlink_copy(better[i], newname + "/" + string_replace(filename_dir(better[i]), dname, "") + "/" + filename_name(better[i]));
	    } else if (directory_exists(better[i])) {
	        directory_create(newname + "/" + string_replace(filename_dir(better[i]), dname, ""));
	    }
	}
}
