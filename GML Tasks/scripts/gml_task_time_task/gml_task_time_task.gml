/// @desc Get percentage of frame time used out of our minimum task fps
/// @func gml_task_time_task()
/// @arg task_map

gml_pragma("forceinline");

// Should be called inside of task scripts

return (get_timer() - global.gml_task_timer_beginning) / (1000000 / argument0[? Gml_Tasks.Fps_Min]);