function unpack_resources(){

	//get rid of old export if one exists
	if (directory_exists(working_directory+"\\Resources\\")){
		directory_destroy(working_directory+"\\Resources\\");	
	}

	//unzip resources
	var num = zip_unzip("Resources.zip",working_directory);
	if (num <= 0){
		var a = 0, b = 0, c = 0;
		try{
		    c = a div b;
		}catch( _exception){
			show_error("Resource Extraction Failed!",true);
		}
	}else{
		show_debug_message("#### Unzipped Resources to : "+string(directory_get_current_working())+" ##### ");	
	}
	
	#region syntax disable for unsued vars
	if (false){
		_exception = 0;
	}
	#endregion
	
	
	return(num);
}