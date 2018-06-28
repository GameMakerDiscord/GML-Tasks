#define gml_task_ini

/// @desc Initialize the gml task system
/// @func gml_task_ini()
/// @arg minimum_framerate,minimum_iterations,debug_messages

global.gml_task_map = ds_map_create();
global.gml_task_list = ds_list_create();
global.gml_task_timer = 0;
global.gml_task_timer_beginning = 0;
global.gml_task_current_task = undefined;

// You can modify these values
if ( argument_count > 0 ) {
	global.gml_task_min_framerate = argument[0];	// Recommended default is the gamespeed
	if ( argument_count > 1 ) {
		global.gml_task_iteration_minimum = argument[1]; // Recommended default is 3
		if ( argument_count > 2 ) {
			global.gml_task_debug = argument[2]; // Displays messages regarding tasks
		}
	}
} else {
	global.gml_task_min_framerate = game_get_speed(gamespeed_fps);
	global.gml_task_iteration_minimum = 3;
	global.gml_task_debug = true;
}

global.gml_task_framerate_time = (1000000 / global.gml_task_min_framerate);

// Enumeraters
enum GmlTasks {
	Scripts,
	Cleanup_Script,
	Values,
	Fps_Min,
	Name,
	Script_Count,
	Completion_Time,
	Script_Complete // Should be returned when a script completes
}

#define gml_task_cleanup

/// @desc Clean up the gml task system
/// @func gml_task_cleanup()
/// @arg minimum_framerate,minimum_iterations,debug_messages

ds_map_destroy(global.gml_task_map);
ds_list_destroy(global.gml_task_list);

global.gml_task_map = -1;
global.gml_task_list = -1;

#define gml_task_create

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
ds_map_add(_map,GmlTasks.Scripts,ds_list_create());
ds_map_add(_map,GmlTasks.Values,ds_map_create());
ds_map_add(_map,GmlTasks.Fps_Min,argument[1]);
ds_map_add(_map,GmlTasks.Name,argument[0]);
ds_map_add(_map,GmlTasks.Completion_Time,get_timer());

// Add scripts to our task map
var
_map = global.gml_task_list[| _index],
_arg_count = argument_count - 2,
_list = _map[? GmlTasks.Scripts];

var _list = _map[? GmlTasks.Scripts];
for ( var i = 0; i < _arg_count; ++ i; ) {
	ds_list_add(_list,argument[i + 2]);
}

// Used for task progress checking
ds_map_add(_map,GmlTasks.Script_Count,_arg_count);

// Debugging
if ( global.gml_task_debug ) {
	show_debug_message("New async task \"" + string(argument[0]) + "\"");
}

return _map;

#define gml_task_find

/// @desc Returns task map when supplied with the name of the task
/// @func gml_task_find()
/// @arg name

gml_pragma("forceinline");

return global.gml_task_map[? argument0];

#define gml_task_find_all

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

#define gml_task_progress_get

/// @desc Get the current progress of a task
/// @func gml_task_progress_get()
/// @arg task_map

gml_pragma("forceinline");

// Returns a percentage from 0 to 1
return argument0[? GmlTasks.Scripts] / argument0[? GmlTasks.Script_Count];

#define gml_task_remove

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

#define gml_task_step

/// @desc Process all tasks in our async task list
/// @func gml_task_step()

gml_pragma("forceinline");

var
_task_map,
_script_list,
_fps_time = get_timer(),
_forced_iteration_count = global.gml_task_iteration_minimum,
_task_skip_list = ds_list_create(),
_task_list_original_size = ds_list_size(global.gml_task_list);

global.gml_task_timer_beginning = _fps_time;
global.gml_task_timer = (get_timer() - _fps_time) / global.gml_task_framerate_time;
while ( (global.gml_task_timer < 1 || _forced_iteration_count > 0) && ds_list_size(global.gml_task_list) > 0 && ds_list_size(_task_skip_list) < _task_list_original_size ) {
	for ( var i = 0; i < ds_list_size(global.gml_task_list); ++ i; ) {
		_task_map = global.gml_task_list[| i];
	
		// If we have time left we execute the next script
		if ( ds_list_find_index(_task_skip_list,_task_map) == -1 ) {
			if ( get_timer() - _fps_time < 1000000 / _task_map[? GmlTasks.Fps_Min] || _forced_iteration_count > 0 ) {
				global.gml_task_current_task = _task_map;
				_script_list = _task_map[? GmlTasks.Scripts];
				if ( script_execute(_script_list[| 0]) == GmlTasks.Script_Complete ) {
					ds_list_delete(_script_list,0);
		
					if ( ds_list_size(_script_list) == 0 ) {
						gml_task_remove(_task_map);
						-- i;
					}
				}
				-- _forced_iteration_count; // Deduct this iteration from the forced iteration count
			} else {
				ds_list_add(_task_skip_list,_task_map);
			}
		}
	}
	global.gml_task_timer = (get_timer() - _fps_time) / global.gml_task_framerate_time;
}

ds_list_destroy(_task_skip_list);

#define gml_task_time_system

/// @desc Get percentage of frame time used out of our minimum system fps
/// @func gml_task_time_system()

gml_pragma("forceinline");

// Should be called inside of task scripts

global.gml_task_timer = (get_timer() - global.gml_task_timer_beginning) / global.gml_task_framerate_time;
return global.gml_task_timer;

#define gml_task_time_task

/// @desc Get percentage of frame time used out of our minimum task fps
/// @func gml_task_time_task()
/// @arg task_map

gml_pragma("forceinline");

// Should be called inside of task scripts

return (get_timer() - global.gml_task_timer_beginning) / (1000000 / argument0[? GmlTasks.Fps_Min]);

#define gml_task_value_add

/// @desc Add value to task map, using a real as a key is recommended
/// @func gml_task_value_add()
/// @arg task_map,key,value

gml_pragma("forceinline");

ds_map_add(argument0[? GmlTasks.Values],argument1,argument2);

#define gml_task_value_get

/// @desc Get value from task map
/// @func gml_task_value_get()
/// @arg task_map,key

gml_pragma("forceinline");

return ds_map_find_value(argument0[? GmlTasks.Values],argument1);

#define gml_task_value_set

/// @desc Sets a value within the task map
/// @func gml_task_value_set()
/// @arg task_map,key,value

gml_pragma("forceinline");

ds_map_set(argument0[? GmlTasks.Values],argument1,argument2);