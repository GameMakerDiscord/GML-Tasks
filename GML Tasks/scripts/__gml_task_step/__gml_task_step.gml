/// @desc Process all tasks in our async task list
/// @func gml_task_step()

gml_pragma("forceinline");

var
_task_map,
_script_list,
_fps_time = get_timer(),
_forced_iteration_count = GML_TASK_MINIMUM_ITERATIONS,
_task_skip_list = ds_list_create(),
_task_list_original_size = ds_list_size(global.gml_task_list);

global.gml_task_timer_beginning = _fps_time;
global.gml_task_timer = (get_timer() - _fps_time) / GML_TASK_FRAMERATE_TIME;
while ( (global.gml_task_timer < 1 || _forced_iteration_count > 0) && ds_list_size(global.gml_task_list) > 0 && ds_list_size(_task_skip_list) < _task_list_original_size ) {
	for ( var i = 0; i < ds_list_size(global.gml_task_list); ++ i; ) {
		_task_map = global.gml_task_list[| i];
	
		// If we have time left we execute the next script
		if ( ds_list_find_index(_task_skip_list,_task_map) == -1 ) {
			if ( get_timer() - _fps_time < 1000000 / _task_map[? Gml_Tasks.Fps_Min] || _forced_iteration_count > 0 ) {
				global.gml_task_current_task = _task_map;
				_script_list = _task_map[? Gml_Tasks.Scripts];
				if ( script_execute(_script_list[| 0]) == Gml_Tasks.Script_Complete ) {
					ds_list_delete(_script_list,0);
		
					if ( ds_list_size(_script_list) == 0 ) {
						gml_task_remove(_task_map);
						-- i;
					}
				}
				_forced_iteration_count --; // Deduct this iteration from the forced iteration count
			} else {
				ds_list_add(_task_skip_list,_task_map);
			}
		}
	}
	global.gml_task_timer = (get_timer() - _fps_time) / GML_TASK_FRAMERATE_TIME;
}

ds_list_destroy(_task_skip_list);