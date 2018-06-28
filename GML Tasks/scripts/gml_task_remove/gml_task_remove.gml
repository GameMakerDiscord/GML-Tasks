/// @desc Remove task from task list
/// @func gml_task_remove()
/// @arg task_map

gml_pragma("forceinline");

// Get the name for later
var _task_name = string(argument0[? GmlTasks.Name]);

// Run cleanup script if it has been assigned
if ( ds_map_exists(argument0,GmlTasks.Cleanup_Script) ) {
	script_execute(argument0[? GmlTasks.Cleanup_Script]);
}

// Populate necessary keys in our task map
ds_list_destroy(argument0[? GmlTasks.Scripts]);
ds_map_destroy(argument0[? GmlTasks.Values]);

var _index = ds_list_find_index(global.gml_task_list,argument0);
ds_map_destroy(global.gml_task_list[| _index]);

ds_list_delete(global.gml_task_list,_index);
ds_map_delete(global.gml_task_map,_task_name);

// Debugging
if ( global.gml_task_debug ) {
	show_debug_message("Async task complete \"" + _task_name + "\"");
}