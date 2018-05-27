/// @desc Queues a script for execution by the bootstrapper
/// @param package_name
/// @param script_name

var _package_name = argument0;
var _script_name  = argument1;
_script_name = __bootstrapper_verify_script_name( _script_name );

//  Make sure we have the necessary data structures in place
__bootstrapper_create_data_structures();

//  If this isn't the first time we're queueing this particular script, don't overwrite the phase counter
if ( !ds_map_exists( global.bootstrapper_phase_map, _script_name ) ) global.bootstrapper_phase_map[? _script_name ] = 0;

//  Store this script for dequeuing via __bootstrapper_resolve()
ds_queue_enqueue( global.bootstrapper_script_queue, _script_name );

//  If we're queuing this script, make sure the finished state for the package is set to <false>
global.bootstrapper_finished_map[? _package_name ] = false;

if ( BOOTSTRAPPER_VERBOSE ) {
    
    show_debug_message( "Bootstrapper: \"" + _script_name + "\" queued for execution" );
    
    if ( ds_map_exists( global.bootstrapper_finished_map, _package_name ) ) {
        if ( global.bootstrapper_finished_map[? _package_name ] ) {
            show_debug_message( "Bootstrapper: \"" + _package_name + "\" set as UNfinished" );
        }
    }
    
}


//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For version information, see __config_bootstrapper().