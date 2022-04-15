alarm[0] = 10;

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

function print_directory_contents(dname, pattern, includedirs, recursive) {
	var result = get_directory_contents(dname, pattern, includedirs, recursive);
	if (!is_undefined(result) && is_array(result)) {
		for (var i = 0; i < array_length(result); i++) {
			show_debug_message(result[i]);
		}
	}
}