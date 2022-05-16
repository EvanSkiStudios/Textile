if !(debug_mode) exit;

draw_set_color(c_white);

draw_text(10,30,"Cam_y: "+string( camera_get_view_y(view_camera[0]) ));

draw_set_color(c_black);
