/// @desc Runs a script name from the callstack (if possible)
/// @param depth

var _array = debug_get_callstack();
var _string = _array[ argument0 ];
var _pos_tag = string_pos( "gml_Script_", _string );
var _pos_colon = string_pos( ":", _string );
if ( _pos_tag <= 0 ) || ( _pos_colon <= 0 ) return "<unknown script>";
return string_copy( _string, _pos_tag + 11, _pos_colon - 12 );


//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For version information, see __config_bootstrapper().