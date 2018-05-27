if ( BOOTSTRAPPER_SHOW_DEBUG ) {
	
	var _names_string = "";
	var _status_string = "";
	
    ds_list_clear( alphabetised_list );
    
    var _size = ds_map_size( global.bootstrapper_finished_map );
    var _package = ds_map_find_first( global.bootstrapper_finished_map );
	for( var _i = 0; _i < _size; _i++ ) {
        ds_list_add( alphabetised_list, _package );
        _package = ds_map_find_next( global.bootstrapper_finished_map, _package );
	}
    ds_list_sort( alphabetised_list, true );
    
    var _size = ds_list_size( alphabetised_list );
	for( var _i = 0; _i < _size; _i++ ) {
        
        _package = alphabetised_list[| _i ];
		_names_string += "\"" + _package + "\"";
		_status_string += "state=" + string( global.bootstrapper_finished_map[? _package ] );
		
		if ( _i < _size-1 ) {
			_names_string += "\n";
			_status_string += "\n";
		}
        
	}
	
	var _spacing = string_width( _names_string ) + 40;
	
	draw_text( 10, 10, BOOTSTRAPPER_INFO + "\niteration=" + string( iterations ) + ", " + last_script );
	draw_text( 10, 70, _names_string );
	draw_text( 10 + _spacing, 70, _status_string );
	
}