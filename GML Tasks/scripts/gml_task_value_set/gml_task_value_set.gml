/// @desc Sets a value within the task map
/// @func gml_task_value_set()
/// @arg task_map,key,value

gml_pragma("forceinline");

var _map = argument0[? Gml_Tasks.Values];
_map[? argument1] = argument2;