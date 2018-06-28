/// @desc Get value from task map
/// @func gml_task_value_get()
/// @arg task_map,key

gml_pragma("forceinline");

return ds_map_find_value(argument0[? GmlTasks.Values],argument1);