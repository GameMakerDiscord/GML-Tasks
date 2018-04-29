/// @desc Get the current progress of a task
/// @func gml_task_progress_get()
/// @arg task_map

gml_pragma("forceinline");

// Returns a percentage from 0 to 1
return argument0[? Gml_Tasks.Scripts] / argument0[? Gml_Tasks.Script_Count];