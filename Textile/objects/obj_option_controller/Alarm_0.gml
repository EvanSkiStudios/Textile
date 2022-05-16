if (cam_y != cam_y_last){

	instance_deactivate_object(obj_type_options);
	instance_activate_region(cleft, cam_y, cw, ch, true);
	
	cam_y_last = cam_y;
}

alarm[0] = alarm_speed;
