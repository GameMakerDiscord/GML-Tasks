for ( var i = 0; i < 10; ++ i; ) {
	var _task_map =
	gml_task_create(

	// Name of task, doesn't have to be a string
	"grid fill " + string(i),

	// Target framerate
	62,

	// Scripts to pass in
	grid_create, // Create the grid
	grid_fill, // Fill the grid

	);

	gml_task_cleanup_script(_task_map,grid_clear);
}