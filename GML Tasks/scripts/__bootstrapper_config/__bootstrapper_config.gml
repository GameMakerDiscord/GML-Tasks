//  Controls how much process data is shown in the Output window.
//  This is useful for debugging dependency behaviours and wait loops.
//  Be warned - this is *very* verbose and it's inappropriate for anything but debug.
#macro BOOTSTRAPPER_VERBOSE false

//  The number of frames (one iterations per frame) oBootstrapper will wait until throwing a warning.
//  This is handy for catching dependency loops etc.
//  For long load periods, this may need to be increased.
#macro BOOTSTRAPPER_ITERATIONS_WARNING 250

//  Controls a pedantic start-up for oBootstrapper to make sure it's not being misused.
//  Advanced users can switch this off and mess around with other behaviours if they want.
#macro BOOTSTRAPPER_STARTUP_CHECK true

//  oBootstrapper has a draw_text() debug output that can be shown during initialisation.
//  It's a bit more friendly than pouring over values in GM's native debugger.
#macro BOOTSTRAPPER_SHOW_DEBUG true

#region -- Internal definitions --

#macro BOOTSTRAPPER_VERSION "00.05.00 (Release Candidate)"
#macro BOOTSTRAPPER_DATE "2018/05/27"
#macro BOOTSTRAPPER_INFO "Bootstrapper v" + BOOTSTRAPPER_VERSION + ", " + BOOTSTRAPPER_DATE + ", for the GameMakerDiscord GitHub organisation, (c) @jujuadams 2018"

#endregion