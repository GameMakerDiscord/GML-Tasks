/// @desc Clean up the gml task system
/// @func gml_task_cleanup()
/// @arg minimum_framerate,minimum_iterations,debug_messages

ds_map_destroy(global.gml_task_map);
ds_list_destroy(global.gml_task_list);

global.gml_task_map = -1;
global.gml_task_list = -1;