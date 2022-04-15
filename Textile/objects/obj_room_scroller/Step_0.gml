if mouse_wheel_up(){
	var new_cam_y = camera_y_pos - scroll_ammount;	
	
	if (new_cam_y < 0){
		new_cam_y = 0;
	}
	
	camera_y_pos = new_cam_y;
}

if mouse_wheel_down(){
	var new_cam_y = camera_y_pos + scroll_ammount;
	
	if (new_cam_y > (room_height - camera_height)){
		new_cam_y = (room_height - camera_height);
	}
	
	camera_y_pos = new_cam_y;
}

camera_set_view_pos(view_camera[0],0,camera_y_pos);
