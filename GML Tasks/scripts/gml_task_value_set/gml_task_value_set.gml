/// @desc Sets a value within the task map
/// @func gml_task_value_set()
/// @arg task_map,key,value

gml_pragma("forceinline");

ds_map_set(argument0[? GmlTasks.Values],argument1,argument2);