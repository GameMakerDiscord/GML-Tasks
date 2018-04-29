/// @desc Add value to task map
/// @func gml_task_value_add()
/// @arg task_map,key,value

gml_pragma("forceinline");

ds_map_add(argument0[? Gml_Tasks.Values],argument1,argument2);