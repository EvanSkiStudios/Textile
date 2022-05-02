//for type options
function check_conflicts_on_togl_enable(){
	if (option_enabled){
		//we are enabled
		//get if we have conflixts
		var conflict_array_length = array_length((global.options_array[array_index].conflicts));
		if ( (conflict_array_length) > 0){
			//get conflictor and see if they are enabled
			var conflictor = global.options_array[array_index].conflicts[0];
			var option = ds_list_find_index(global.options_index, conflictor);
			
			//if conflictor is enabled then update our status
			if (global.options_array[option].settings.is_enabled){
				option_is_conflicted = true;
				global.options_array[option].settings.is_conflicted = true;
				var option_inst = global.options_array[option].my_id;
				with(option_inst) {option_is_conflicted = true;}
				
				options_set_and_reload();
			}else{
				//conflicting options are not enabled
				option_is_conflicted = false;	
				options_set_and_reload();
			}
		}

	}else{
		//we are disabled --same!
		option_is_conflicted = false;
		options_set_and_reload();
	}
}

function check_conflicts_step(){
	//assuming we are in the conflicted state
	
	//get if we have conflixts
	var conflict_array_length = array_length((global.options_array[array_index].conflicts));
	if ( (conflict_array_length) > 0){
		//get conflictor and see if they are enabled
		var conflictor = global.options_array[array_index].conflicts[0];
		var option = ds_list_find_index(global.options_index, conflictor);
			
		//if conflictor is enabled then update our status
		if (global.options_array[option].settings.is_enabled){
			option_is_conflicted = true;
			global.options_array[option].settings.is_conflicted = true;
			var option_inst = global.options_array[option].my_id;
			with(option_inst) {option_is_conflicted = true;}
				
			options_set_and_reload();
		}else{
			//conflicting options are not enabled
			option_is_conflicted = false;	
			options_set_and_reload();
		}
	}
}
