/// @desc Initialize the gml task system
/// @func gml_task_ini()
/// @arg minimum_framerate,minimum_iterations,debug_messages

gml_pragma( "global", "__gml_task_init()" );

global.gml_task_map             = ds_map_create();
global.gml_task_list            = ds_list_create();
global.gml_task_timer           = 0;
global.gml_task_timer_beginning = 0;
global.gml_task_current_task    = undefined;

bootstrapper_instance_create( "GML Task", __oGMLTask );
bootstrapper_package_finish( "GML Task" );