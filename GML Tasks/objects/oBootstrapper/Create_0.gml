iterations = 0;
last_script = "";
alphabetised_list = ds_list_create();

//  Make basic start-up checks (see __config_bootstrapper)
//  This can be turned off if specific custom behaviours are needed
if ( BOOTSTRAPPER_STARTUP_CHECK ) {
	if ( instance_count > global.bootstrapper_instance_count ) {
		show_error( "oBootstrapper is not the only instance in this room (\"" + room_get_name( room ) + "\").\nPlease create a new empty room at the top of the \"Rooms\" resource section.\n\n(This check can turned off in __bootstrapper_config()\n ", false );
	} else if ( room != room_first ) {
		show_error( "This room (\"" + room_get_name( room ) + "\" is not first.\nPlease create a new empty room at the top of the \"Rooms\" resource section.\n\n(This check can turned off in __bootstrapper_config()\n ", false );
	}
}

show_debug_message( "Bootstrapper: Initialisation process started..." );