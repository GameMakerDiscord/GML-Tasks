draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);
draw_text_transformed(640,240,"Framerate: " + string(fps_real),4,4,0);


for ( var i = 0; i < ds_list_size(global.gml_task_list); ++ i; ) {
	
	var _task_map = gml_task_find(i);
	if ( _task_map != undefined ) {
		var
		_x = gml_task_value_get(_task_map,"x"),
		_y = gml_task_value_get(_task_map,"y");

		draw_text_transformed(640,360 + (i * 30),string(i) + ": " + string(_x) + ", " + string(_y),2,2,0);
	}
}