//  Execute this script on boot
gml_pragma( "global", "__bootstrapper_init()" );

//  Make sure we have the necessary data structures in place
__bootstrapper_create_data_structures();

//  Create the bootstrapper object in the first room
//  The bootstrapper object runs __bootstrapper_resolve() every frame to execute scripts
room_instance_add( room_first, 0, 0, oBootstrapper );


//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For version information, see __config_bootstrapper().