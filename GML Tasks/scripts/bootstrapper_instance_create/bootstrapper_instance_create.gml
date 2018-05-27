/// @desc Safely creates an instance during the pre-room boot phase
/// @param package_name
/// @param object
/// @param [singleton]
/// @param [x]
/// @param [y]

var _package_name = argument[0];
var _object       = argument[1];
var _singleton    = ((argument_count > 2) && (argument[2] != undefined))? argument[2] : true;
var _x            = ((argument_count > 3) && (argument[3] != undefined))? argument[3] : 0;
var _y            = ((argument_count > 4) && (argument[4] != undefined))? argument[4] : 0;

//  Make sure we have the necessary data structures in place for scripts to interface with
__bootstrapper_create_data_structures();

//  If we're doing operations, unset the finished state of the package
bootstrapper_package_unfinish( _package_name );

//  If the bootstrapper has already started processing, we can safely spawn in an instance
if ( global.bootstrapper_resolve_started ) {
    
    //  Check against other objects of this type if we want a singleton
    if ( _singleton && instance_exists( _object ) ) return noone;
    
    return instance_create_depth( _x, _y, 0, _object );
    
} else {
    
    //  Check against other objects of this type if we want a singleton
    if ( _singleton && ds_map_exists( global.bootstrapper_instances_created, _object ) ) return noone;
    global.bootstrapper_instances_created[? object_get_name( _object ) ] = true;
    
    //  However, if we're in a pre-room state, we need to add an object to first room
    global.bootstrapper_instance_count++;
    room_instance_add( room_first, _x, _y, _object );
    
    //  Better tell people what's going on...
    show_debug_message( "Bootstrapper: Added an instance of \"" + object_get_name( _object ) + "\" to \"" + room_get_name( room_first ) + "\"" );
    return noone;
    
}


//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For version information, see __config_bootstrapper().