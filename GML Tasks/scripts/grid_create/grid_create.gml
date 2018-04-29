/// @func grid_create()

if ( global.gml_task_current_task == undefined ) {
	var _task_map = gml_task_find("grid_fill");
} else {
	var _task_map = global.gml_task_current_task;
}

gml_task_value_add(_task_map,"grid",ds_grid_create(5000,1000));
gml_task_value_add(_task_map,"x",0);
gml_task_value_add(_task_map,"y",0);

return Gml_Tasks.Script_Complete;