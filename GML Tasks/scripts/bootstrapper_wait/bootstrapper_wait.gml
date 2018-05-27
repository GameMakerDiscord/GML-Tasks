/// @desc Queues a script for re-execution by the bootstrapper, without incrementing the phase counter
/// @param package_name
/// @param script_name

var _package_name = argument0;
var _script_name  = argument1;
_script_name = __bootstrapper_verify_script_name( _script_name );

//  Make sure we have the necessary data structures in place
__bootstrapper_create_data_structures();

//  Tell the boostrapper to not increment the phase counter for this script
global.bootstrapper_suppress_phase_map[? _script_name ] = true

bootstrapper_queue( _package_name, _script_name );


//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For version information, see __config_bootstrapper().