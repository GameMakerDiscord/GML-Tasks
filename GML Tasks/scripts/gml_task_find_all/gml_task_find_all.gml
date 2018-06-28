/// @desc Returns an array containing all active tasks by name
/// @func gml_task_find_all()

gml_pragma("forceinline");

var
_size = ds_list_size(global.gml_task_list),
_array = array_create(_size);

for ( var i = 0; i < _size; ++ i; ) {
	_array[i] = ds_map_find_value(global.gml_task_list[| i],GmlTasks.Name);
}

return _array;