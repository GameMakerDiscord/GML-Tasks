__bootstrapper_resolve();

//  Output a debug warning if we think we're in an infinite loop (see __config_bootstrapper)
iterations++;
if ( max( 0, iterations - BOOTSTRAPPER_ITERATIONS_WARNING ) mod (3*game_get_speed( gamespeed_fps )) == 1 ) {
	show_error( "The bootstrapper may be stuck in an infinite loop (more than " + string( BOOTSTRAPPER_ITERATIONS_WARNING ) + " iterations)\nCheck that packages are correctly imported and are calling bootstrapper_package_finish()\n ", false );
}