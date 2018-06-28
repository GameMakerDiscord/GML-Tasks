/// @func grid_clear()

if ( global.gml_task_current_task == undefined ) {
	var _task_map = gml_task_find("grid_fill");
} else {
	var _task_map = global.gml_task_current_task;
}

ds_grid_destroy(gml_task_value_get(_task_map,"grid"));

return GmlTasks.Script_Complete;