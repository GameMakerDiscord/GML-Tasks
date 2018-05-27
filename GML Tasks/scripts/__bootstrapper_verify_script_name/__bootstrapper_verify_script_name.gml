/// @desc Verifies that a script name is syntactically valid for us with the bootstrapper.
/// @param script_name

var _script_name = argument0;

if ( !is_string( _script_name ) ) show_error( "Please provide script names as strings.\n ", true );
if ( asset_get_index( _script_name ) < 0 ) {
    if ( string_pos( "(", _script_name ) > 0 ) show_error( "\"" + _script_name + "\" is invalid as it includes brackets.\nWhen specifying a script name, please do so without brackets.\n ", true );
    show_error( "The script called \"" + _script_name + "\" cannot be found.\n ", true );
}

return _script_name;


//  This bootstrapper was written by @jujuadams for the GameMakerDiscord GitHub organisation.
//  MIT License (c) @jujuadams 2018
//  contact@jujuadams.com
//  For version information, see __config_bootstrapper().