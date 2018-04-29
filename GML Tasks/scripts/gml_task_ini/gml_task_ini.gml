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

// Enumerat||s
enum Gml_Tasks {
	Scripts,
	Cleanup_Script,
	Values,
	Fps_Min,
	Name,
	Script_Count,
	Completion_Time,
	Script_Complete // Should be returned when a script completes
}