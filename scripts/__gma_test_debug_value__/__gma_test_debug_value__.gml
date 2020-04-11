function __gma_test_debug_value__() {  
	//undefined
	test_case(__gma_debug_value__(undefined), "(undefined)\r\nundefined", "__gma_test_debug_value__: undefined");
  
	//real
	test_case(__gma_debug_value__(7), "(number)\r\n7", "__gma_test_debug_value__: 7");
	test_case(__gma_debug_value__(-3.52), "(number)\r\n-3.52", "__gma_test_debug_value__: -3.52");
  test_case(__gma_debug_value__(infinity), "(number)\r\ninfinity", "__gma_test_debug_value__: infinity");
	test_case(__gma_debug_value__(-infinity), "(number)\r\n-infinity", "__gma_test_debug_value__: -infinity");
  test_case(__gma_debug_value__(NaN), "(number)\r\nNaN", "__gma_test_debug_value__: NaN");
  
  //int64
  test_case(__gma_debug_value__(int64(12)), "(int64)\r\nint64(12)", "__gma_test_debug_value__: int64(12)");
  test_case(__gma_debug_value__(int64(-9)), "(int64)\r\nint64(-9)", "__gma_test_debug_value__: int64(-9)");
  
  //ptr
	if (os_browser == browser_not_a_browser) {
		test_case(__gma_debug_value__(ptr($3A6B)), "(ptr)\r\nptr($3A6B)", "__gma_test_debug_value__: ptr($3A6B)");
	}
	
	//strings
	test_case(__gma_debug_value__(""), "(string)\r\n" + @'""', "__gma_test_debug_value__: empty string");
	test_case(__gma_debug_value__("waahoo"), "(string)\r\n" + @'"waahoo"', "__gma_test_debug_value__: waahoo string");
	test_case(__gma_debug_value__("this is \"waahoo\""), "(string)\r\n" + @'"this is \"waahoo\""', "__gma_test_debug_value__: this is waahoo string");
  test_case(__gma_debug_value__("\n\r\b\f\t\v\a\\\""), "(string)\r\n" + @'"\n\r\b\f\t\v\a\\\""', "__gma_test_debug_value__: escape char string");
  
	//bool
	test_case(__gma_debug_value__(bool(true)), "(bool)\r\nbool(true)", "__gma_test_debug_value__: bool(true)");
	test_case(__gma_debug_value__(bool(false)), "(bool)\r\nbool(false)", "__gma_test_debug_value__: bool(false)");
	
	//1d array
	var arrayA = [5, 6, 7];
	test_case(__gma_debug_value__(arrayA), "(array)\r\n[5, 6, 7]", "__gma_test_debug_value__: 1D array");
  
	//2d array
	var arrayB = [[5, "a"], ["b", 7]];
	test_case(__gma_debug_value__(arrayB), "(array)\r\n[[5, \"a\"], [\"b\", 7]]", "__gma_test_debug_value__: 2D array");

	//list
	var listEmpty = test_fixture_list(),
			listFilled = test_fixture_list(3, "waahoo", [5, 6, 7]);
	test_case(__gma_debug_list_value__(listEmpty), "list()", "__gma_test_debug_value__: empty list");
	test_case(__gma_debug_list_value__(listFilled), "list(3, \"waahoo\", [5, 6, 7])", "__gma_test_debug_value__: list");
	//invalid list
	var listDNE = listFilled+1;
	while (ds_exists(listDNE, ds_type_list)) listDNE++;
	test_case(__gma_debug_list_value__(listDNE), "list(<INVALID>)", "__gma_test_debug_value__: bad list");
	//list cleanup
	ds_list_destroy(listEmpty);
	ds_list_destroy(listFilled);
  
  //map
  var mapEmpty = test_fixture_map(),
      mapFilled = test_fixture_map("foo", "bar", "baz", 907);
  test_case(__gma_debug_map_value__(mapEmpty), "map()", "__gma_test_debug_value__: empty map");
  test_case(bool(string_pos("map(", __gma_debug_map_value__(mapFilled)) > 0), bool(true), "__gma_test_debug_value__: map 1");
  test_case(bool(string_pos(@'"foo": "bar"', __gma_debug_map_value__(mapFilled)) > 0), bool(true), "__gma_test_debug_value__: map 2");
  test_case(bool(string_pos(@'"baz": 907', __gma_debug_map_value__(mapFilled)) > 0), bool(true), "__gma_test_debug_value__: map 3");
  test_case(bool(string_pos(")", __gma_debug_map_value__(mapFilled)) > 0), bool(true), "__gma_test_debug_value__: map 4");
  //invalid map
  var mapDNE = mapFilled+1;
  while (ds_exists(mapDNE, ds_type_map)) mapDNE++;
  test_case(__gma_debug_map_value__(mapDNE), "map(<INVALID>)", "__gma_test_debug_value__: bad map");
  //map cleanup
  ds_map_destroy(mapEmpty);
  ds_map_destroy(mapFilled);
  
  //grid
  var gridEmpty = test_fixture_grid(0, 0),
      gridFilled = test_fixture_grid(3, 2, "foo", "bar", "baz", 123, 456, 789);
  test_case(__gma_debug_grid_value__(gridEmpty), "grid()", "__gma_test_debug_value__: empty grid");
  test_case(__gma_debug_grid_value__(gridFilled), @'grid("foo", "bar", "baz"; 123, 456, 789)', "__gma_test_debug_value__: grid");
  //invalid grid
  var gridDNE = gridFilled+1;
  while (ds_exists(gridDNE, ds_type_grid)) gridDNE++;
  test_case(__gma_debug_grid_value__(gridDNE), "grid(<INVALID>)", "__gma_test_debug_value__: bad grid");
  //grid cleanup
  ds_grid_destroy(gridEmpty);
  ds_grid_destroy(gridFilled);
}
