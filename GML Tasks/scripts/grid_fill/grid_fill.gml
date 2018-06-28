/// @func grid_fill()

if ( global.gml_task_current_task == undefined ) {
	var _task_map = gml_task_find("grid_fill");
} else {
	var _task_map = global.gml_task_current_task;
}

var
_x = gml_task_value_get(_task_map,"x"),
_y = gml_task_value_get(_task_map,"y"),
_grid = gml_task_value_get(_task_map,"grid"),
_time_allowed = (1000000 / _task_map[? GmlTasks.Fps_Min]) * (1 / ds_list_size(global.gml_task_list)),
_time_start = get_timer();

while ( get_timer() - _time_start < _time_allowed ) {
	_grid[# _x, _y] = _x + _y;
	_x ++;

	if ( _x == 5000 ) {
		_x = 0;
		_y ++;
		gml_task_value_set(_task_map,"y",_y);
		if ( _y == 1000 ) {
			return GmlTasks.Script_Complete;
		}
	}
}

gml_task_value_set(_task_map,"x",_x);

return 0;