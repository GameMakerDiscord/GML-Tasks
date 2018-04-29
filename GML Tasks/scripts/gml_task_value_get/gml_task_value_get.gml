/// @desc Get value from task map
/// @func gml_task_value_get()
/// @arg task_map,key

gml_pragma("forceinline");

var _map = argument0[? Gml_Tasks.Values];
return _map[? argument1];