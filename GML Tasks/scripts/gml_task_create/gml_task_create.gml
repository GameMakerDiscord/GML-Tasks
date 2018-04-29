/// @desc Creates a task within the async system
/// @func gml_task_create()
/// @arg name,fps_min,[scripts]

/*
	Returns map value for task.
	Returns undefined if task could not be created.
*/

gml_pragma("forceinline");

var _index = ds_list_size(global.gml_task_list);

// Add task to our async map with a pointer to our list index
var _task_exists = ds_map_exists(global.gml_task_map,argument[0]);

if ( _task_exists ) {
	show_debug_message("Task \"" + string(argument[0]) + "\" already exists!");
	return undefined;
}

// Create our map in the list
ds_list_add(global.gml_task_list,ds_map_create());
ds_map_add(global.gml_task_map,argument[0],global.gml_task_list[| _index]);

// Cache the map for faster access throughout the script
var _map = global.gml_task_list[| _index];

// Populate necessary keys in our task map
ds_map_add(_map,Gml_Tasks.Scripts,ds_list_create());
ds_map_add(_map,Gml_Tasks.Values,ds_map_create());
ds_map_add(_map,Gml_Tasks.Fps_Min,argument[1]);
ds_map_add(_map,Gml_Tasks.Name,argument[0]);
ds_map_add(_map,Gml_Tasks.Completion_Time,get_timer());

// Add scripts to our task map
var
_map = global.gml_task_list[| _index],
_arg_count = argument_count - 2,
_list = _map[? Gml_Tasks.Scripts];

var _list = _map[? Gml_Tasks.Scripts];
for ( var i = 0; i < _arg_count; ++ i; ) {
	ds_list_add(_list,argument[i + 2]);
}

// Used for task progress checking
ds_map_add(_map,Gml_Tasks.Script_Count,_arg_count);

// Debugging
if ( global.gml_task_debug ) {
	show_debug_message("New async task \"" + string(argument[0]) + "\"");
}

return _map;