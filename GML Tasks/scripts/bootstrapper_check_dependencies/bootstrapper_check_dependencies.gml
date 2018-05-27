/// @desc Checks all dependencies have been installed, and returns true if all dependencies have finished initialising
/// @param [dependency_name]
/// @param [dependency_name...]

//  Make sure we have the necessary data structures in place for scripts to interface with
__bootstrapper_create_data_structures();

if ( !global.bootstrapper_resolve_started ) {
    show_error( "bootstrapper_check_dependencies() cannot be used immediately on boot.\nPlease run dependency checks in a queued script using bootstrapper_queue().\n ", true );
}

var _ready = true;
var _found = true;
for( var _i = 0; _i < argument_count; _i++ ) {
    
    var _dependency = argument[_i];
    
    if ( !ds_map_exists( global.bootstrapper_finished_map, _dependency ) ) {
        _ready = false;
        _found = false;
        break;
    } 
    
    if ( !global.bootstrapper_finished_map[? _dependency ] ) {
        _ready = false;
        break;
    }
    
}

if ( !_found ) {
    show_error( "\"" + __bootstrapper_get_script( 2 ) + "\" could not find its dependency \"" + string( _dependency ) + "\".\nPlease import all required dependency packages.\n ", true );
}

return _ready;


//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For version information, see __config_bootstrapper().