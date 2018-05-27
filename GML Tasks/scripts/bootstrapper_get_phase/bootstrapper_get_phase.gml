/// @desc Returns the current phase number for a script: 1 = first time called by oBootstrapper
/// @param script_name

var _script_name = argument0;
_script_name = __bootstrapper_verify_script_name( _script_name );

//  Make sure we have the necessary data structures in place for scripts to interface wit
__bootstrapper_create_data_structures();

//If this script hasn't been queued yet, return 0
if ( !ds_map_exists( global.bootstrapper_phase_map, _script_name ) ) return 0;
return global.bootstrapper_phase_map[? _script_name ];


//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For version information, see __config_bootstrapper().