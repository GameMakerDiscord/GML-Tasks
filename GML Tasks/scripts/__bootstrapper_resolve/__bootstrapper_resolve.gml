global.bootstrapper_resolve_started = true;

if ( ds_queue_empty( global.bootstrapper_script_queue ) ) {
	
	//  Check to see if all the packages have declared their initialisation complete
	var _complete = true;
    for( var _key = ds_map_find_first( global.bootstrapper_finished_map ); !is_undefined( _key ); _key = ds_map_find_next( global.bootstrapper_finished_map, _key ) ) {
        if ( !global.bootstrapper_finished_map[? _key ] ) {
            _complete = false;
            break;
        }
    }
    
	if ( _complete ) {
		
		//  Clear up our data structures, we don't need these any more
		ds_queue_destroy( global.bootstrapper_script_queue       );
		ds_map_destroy(   global.bootstrapper_phase_map          );
		ds_map_destroy(   global.bootstrapper_suppress_phase_map );
        ds_map_destroy(   global.bootstrapper_instances_created  );
		global.bootstrapper_script_queue       = undefined;
		global.bootstrapper_phase_map          = undefined;
        global.bootstrapper_suppress_phase_map = undefined;
    
		//  Let's start the game :D
		show_debug_message( "Bootstrapper: Initialisation process complete! Now proceeding to room \"" + room_get_name( room_next( room ) ) +"\"." );
        global.bootstrapper_complete = true;
        
        if ( room == room_last ) {
            show_error( "Bootstrapper wants to move to the next room, but this is the last room.\nBootstrapper will now spontaneously self-destruct.\n ", false );
            instance_destroy();
        } else {
		    room_goto_next();
        }
		
	}
	
} else {
	
	//  Then we actually pull out the script to execute, and remove it from the priority queue
	var _script_name = ds_queue_dequeue( global.bootstrapper_script_queue );
    
    //  Scripts are stored as a name string so we need to turn that back into an index
	var _script = asset_get_index( _script_name );
    
	if ( ds_map_exists( global.bootstrapper_phase_map, _script_name ) ) {
        
        if ( !ds_map_exists( global.bootstrapper_suppress_phase_map, _script_name ) ) {
    		//  Increment this script's phase counter (if we're not suppressing it)
    		global.bootstrapper_phase_map[? _script_name ]++;
        } else {
            ds_map_delete( global.bootstrapper_suppress_phase_map, _script_name );
        }
        
	} else {
		//  Scripts are added to the queue at the same time as the map. This should never fire
		show_error( "Script \"" + _script_name + "\" is not present in phase map.\nThis is a weird error!\n ", false );
	}
	
	if ( !script_exists( _script ) ) {
		//  Catch human error...
		show_error( "Script \"" + _script_name + "\" doesn't exist.\nPlease check all occurances of \"bootstrapper_queue()\" for errors.\n ", false );
	} else {
		//  ...otheriwse run the code!
		if ( BOOTSTRAPPER_VERBOSE ) show_debug_message( "Bootstrapper: Executing script \"" + _script_name + "\" with phase=" + string( global.bootstrapper_phase_map[? _script_name ] ) + " (global iteration=" + string( iterations ) + ")" );
	    script_execute( _script );
	}
	
    //  If we're using the debug output, make a note of some details of the last script that was executed
	if ( BOOTSTRAPPER_SHOW_DEBUG ) last_script = "\"" + _script_name + "\", phase=" + string( global.bootstrapper_phase_map[? _script_name ] );
    
    //  If the dev wants to see all the details of initialisation, let 'em have it! (see __config_bootstrapper)
	if ( BOOTSTRAPPER_VERBOSE && ds_queue_empty( global.bootstrapper_script_queue ) ) show_debug_message( "Bootstrapper: Script queue is now empty." );
	
}


//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For version information, see __config_bootstrapper().