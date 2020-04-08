function __gma_test_debug_type__() {
	//undefined
	test_case(typeof(undefined), "undefined", "__gma_test_debug_type__: undefined");

	//real
	test_case(typeof(7), "number", "__gma_test_debug_type__: 7");
	test_case(typeof(-pi), "number", "__gma_test_debug_type__: -pi");

	//string
	test_case(typeof(""), "string", "__gma_test_debug_type__: empty string");
	test_case(typeof("waahoo"), "string", "__gma_test_debug_type__: waahoo string");
  
	//1D array
	var arrayA = [5, 6, 7];
	test_case(typeof(arrayA), "array", "__gma_test_debug_type__: 1D array");

	//2D array
	var arrayB = [[5, "a"], ["b", 7]];
	test_case(typeof(arrayB), "array", "__gma_test_debug_type__: 2D array");
}
