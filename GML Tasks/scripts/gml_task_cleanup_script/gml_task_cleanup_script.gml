/// @desc Assigns cleanup script to task
/// @func gml_task_cleanup_script()
/// @arg task_map,script

gml_pragma("forceinline");

if ( ds_map_exists(argument0,GmlTasks.Cleanup_Script) ) {
	ds_map_add(argument0,GmlTasks.Cleanup_Script,argument1);
} else {
	argument0[? GmlTasks.Cleanup_Script] = argument1;
}