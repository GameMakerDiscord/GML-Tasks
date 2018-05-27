#macro GML_TASK_MINIMUM_FRAMERATE game_get_speed(gamespeed_fps)
#macro GML_TASK_MINIMUM_ITERATIONS 3
#macro GML_TASK_DEBUG true

#region -- Iternal Definitions --

#macro GML_TASK_FRAMERATE_TIME (1000000 / GML_TASK_MINIMUM_FRAMERATE)

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

#endregion