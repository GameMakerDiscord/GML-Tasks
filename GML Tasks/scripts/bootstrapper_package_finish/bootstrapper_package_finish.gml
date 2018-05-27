/// @desc Sets a package's state as finished
/// @param package_name

var _package_name = argument0;

//  Make sure we have the necessary data structures in place
__bootstrapper_create_data_structures();

if ( BOOTSTRAPPER_VERBOSE ) show_debug_message( "Bootstrapper: \"" + _package_name + "\" set as finished" );
global.bootstrapper_finished_map[? _package_name ] = true;


//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For version information, see __config_bootstrapper().