/// @desc Example Create

gml_task_ini(60,3,true); // This instance ideally should be created first

// All the code below is for the sake of example

for ( var i = 0; i < 10; ++ i; ) {
	var _task_map =
	gml_task_create(

	// Name of task, should be a real
	i,

	// Target framerate
	62,

	// Scripts to pass in
	grid_create, // Create the grid
	grid_fill, // Fill the grid

	);

	gml_task_cleanup_script(_task_map,grid_clear);
}