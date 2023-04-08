///@func assert_contains(got, content, msg)
///@param {String,Array,Id.DsList} got The actual received value for the assertion
///@param {Any} content A value to look for in the received value
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten string, DS list or array contains a value equal to content.
function assert_contains(got, content, msg="Inclusion assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check types and assertion
	var found = false;
	var size = 0;
	switch (typeof(got)) {
		case "string":
			if (typeof(content) == "string") {
				if (string_pos(content, got) == 0) {
					__gma_assert_error_raw__(msg, "A string that contains " + __gma_debug_value__(content), __gma_debug_value__(got));
				}
			}
			else {
				msg += " (invalid content type)";
				__gma_assert_error_raw__(msg, "A string", __gma_debug_value__(content));
			}
		break;
		case "array":
			var arr = got;
			size = array_length(arr);
			for (var i = 0; i < size; i++) {
				if (__gma_equal__(content, arr[i])) {
					found = true;
					break;
				}
			}
			if (!found) {
				__gma_assert_error_raw__(msg, "An array that contains " + __gma_debug_value__(content), __gma_debug_value__(got));
			}
		break;
		case "number": case "int32": case "int64":
			if (ds_exists(got, ds_type_list)) {
				var list = got;
				size = ds_list_size(list);
				for (var i = 0; i < size; i++) {
					if (__gma_equal__(content, list[| i])) {
						found = true;
						break;
					}
				}
				if (!found) {
					__gma_assert_error_raw__(msg, "A list that contains " + __gma_debug_value__(content), __gma_debug_list_value__(got));
				}
			}
			else {
				msg += " (list ID does not exist)";
				__gma_assert_error_raw__(msg, "An existent list ID", __gma_debug_value__(got));
			}
		break;
		default:
			msg += " (invalid container type)";
			__gma_assert_error_raw__(msg, "A string, array or list", __gma_debug_value__(got));
		break;
	}
}

///@func assert_contains_exact(got, content, msg)
///@param {String,Array,Id.DsList} got The actual received value for the assertion
///@param {Any} content A value to look for in the received value
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten string, list or array contains a value exactly equal to content (as compared using ==).
function assert_contains_exact(got, content, msg="Exact inclusion assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check types and assertion
	var found = false;
	var size = 0;
	switch (typeof(got)) {
		case "string":
			if (typeof(content) == "string") {
				if (string_pos(content, got) == 0) {
					__gma_assert_error_raw__(msg, "A string that contains exactly " + __gma_debug_value__(content), __gma_debug_value__(got));
				}
			}
			else {
				msg += " (invalid content type)";
				__gma_assert_error_raw__(msg, "A string", __gma_debug_value__(content));
			}
		break;
		case "array":
			var arr = got;
			size = array_length(arr);
			for (var i = 0; i < size; i++) {
				if (typeof(content) == typeof(arr[i]) && content == arr[i]) {
					found = true;
					break;
				}
			}
			if (!found) {
				__gma_assert_error_raw__(msg, "An array that contains exactly " + __gma_debug_value__(content), __gma_debug_value__(got));
			}
		break;
		case "number": case "int32": case "int64":
			if (ds_exists(got, ds_type_list)) {
				var list = got;
				size = ds_list_size(list);
				for (var i = 0; i < size; i++) {
					if (typeof(content) == typeof(list[| i]) && content == list[| i]) {
						found = true;
						break;
					}
				}
				if (!found) {
					__gma_assert_error_raw__(msg, "A list that contains exactly " + __gma_debug_value__(content), __gma_debug_list_value__(got));
				}
			}
			else {
				msg += " (list ID does not exist)";
				__gma_assert_error_raw__(msg, "An existent list ID", __gma_debug_value__(got));
			}
		break;
		default:
			msg += " (invalid container type)";
			__gma_assert_error_raw__(msg, "A string, array or list", __gma_debug_value__(got));
		break;
	}
}

///@func assert_doesnt_contain(got, content, msg)
///@param {String,Array,Id.DsList} got The actual received value for the assertion
///@param {Any} content A value to look for in the received value
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten string, list or array does not contain a value equal to content.
function assert_doesnt_contain(got, content, msg="Exclusion assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check types and assertion
	var found = false;
	var size = 0;
	switch (typeof(got)) {
		case "string":
			if (typeof(content) == "string") {
				if (string_pos(content, got) > 0) {
					__gma_assert_error_raw__(msg, "A string that does not contain " + __gma_debug_value__(content), __gma_debug_value__(got));
				}
			}
			else {
				msg += " (invalid content type)";
				__gma_assert_error_raw__(msg, "A string", __gma_debug_value__(content));
			}
		break;
		case "array":
			var arr = got;
			size = array_length(arr);
			for (var i = 0; i < size; i++) {
				if (__gma_equal__(content, arr[i])) {
					found = true;
					break;
				}
			}
			if (found) {
				__gma_assert_error_raw__(msg, "An array that does not contain " + __gma_debug_value__(content), __gma_debug_value__(got));
			}
		break;
		case "number": case "int32": case "int64":
			if (ds_exists(got, ds_type_list)) {
				var list = got;
				size = ds_list_size(list);
				for (var i = 0; i < size; i++) {
					if (__gma_equal__(content, list[| i])) {
						found = true;
						break;
					}
				}
				if (found) {
					__gma_assert_error_raw__(msg, "A list that does not contain " + __gma_debug_value__(content), __gma_debug_list_value__(got));
				}
			}
			else {
				msg += " (list ID does not exist)";
				__gma_assert_error_raw__(msg, "An existent list ID", __gma_debug_value__(got));
			}
		break;
		default:
			msg += " (invalid container type)";
			__gma_assert_error_raw__(msg, "A string, array or list", __gma_debug_value__(got));
		break;
	}
}

///@func assert_doesnt_contain_exact(got, content, msg)
///@param {String,Array,Id.DsList} got The actual received value for the assertion
///@param {Any} content A value to look for in the received value
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten string, list or array does not contain a value exactly equal to content (as compared using ==).
function assert_doesnt_contain_exact(got, content, msg="Exact exclusion assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check types and assertion
	var found = false;
	var size = 0;
	switch (typeof(got)) {
		case "string":
			if (typeof(content) == "string") {
				if (string_pos(content, got) > 0) {
					__gma_assert_error_raw__(msg, "A string that does not contain exactly " + __gma_debug_value__(content), __gma_debug_value__(got));
				}
			}
			else {
				msg += " (invalid content type)";
				__gma_assert_error_raw__(msg, "A string", __gma_debug_value__(content));
			}
		break;
		case "array":
			var arr = got;
			size = array_length(arr);
			for (var i = 0; i < size; i++) {
				if (typeof(content) == typeof(arr[i]) && content == arr[i]) {
					found = true;
					break;
				}
			}
			if (found) {
				__gma_assert_error_raw__(msg, "An array that eoes not contain exactly " + __gma_debug_value__(content), __gma_debug_value__(got));
			}
		break;
		case "number": case "int32": case "int64":
			if (ds_exists(got, ds_type_list)) {
				var list = got;
				size = ds_list_size(list);
				for (var i = 0; i < size; i++) {
					if (typeof(content) == typeof(list[| i]) && content == list[| i]) {
						found = true;
						break;
					}
				}
				if (found) {
					__gma_assert_error_raw__(msg, "A list that does not contain exactly " + __gma_debug_value__(content), __gma_debug_list_value__(got));
				}
			}
			else {
				msg += " (list ID does not exist)";
				__gma_assert_error_raw__(msg, "An existent list ID", __gma_debug_value__(got));
			}
		break;
		default:
			msg += " (invalid container type)";
			__gma_assert_error_raw__(msg, "A string, array or list", __gma_debug_value__(got));
		break;
	}
}

///@func assert_contains_2d(got, content, msg)
///@param {Array<Array<Any>>,Id.DsGrid} got The actual received value for the assertion
///@param {Any} content A value to look for in the received value
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten grid or 2D array contains a value equal to content.
function assert_contains_2d(got, content, msg="2D inclusion assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check types and assertion
	var found = false;
	var size_i, size_j;
	switch (typeof(got)) {
		case "array":
			var arr = got;
			size_i = array_length(arr);
			for (var i = 0; i < size_i && !found; i++) {
				size_j = array_length(arr[i]);
				for (var j = 0; j < size_j; j++) {
					if (__gma_equal__(content, arr[i][j])) {
						found = true;
						break;
					}
				}
			}
			if (!found) {
				__gma_assert_error_raw__(msg, "A 2D array that contains " + __gma_debug_value__(content), __gma_debug_value__(got));
			}
		break;
		case "number": case "int32": case "int64":
			if (ds_exists(got, ds_type_grid)) {
				var grid = got;
				size_i = ds_grid_width(grid);
				size_j = ds_grid_height(grid);
				for (var i = 0; i < size_i && !found; i++) {
					for (var j = 0; j < size_j; j++) {
						if (__gma_equal__(content, grid[# i, j])) {
							found = true;
							break;
						}
					}
				}
				if (!found) {
					__gma_assert_error_raw__(msg, "A grid that contains " + __gma_debug_value__(content), __gma_debug_grid_value__(got));
				}
			}
			else {
				msg += " (grid ID does not exist)";
				__gma_assert_error_raw__(msg, "An existent grid ID", __gma_debug_value__(got));
			}
		break;
		default:
			msg += " (invalid container type)";
			__gma_assert_error_raw__(msg, "A grid or 2D array", __gma_debug_value__(got));
		break;
	}
}

///@func assert_contains_exact_2d(got, content, msg)
///@param {Array<Array<Any>>,Id.DsGrid} got The actual received value for the assertion
///@param {Any} content A value to look for in the received value
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten grid or 2D array contains a value equal to content, as compared using ==.
function assert_contains_exact_2d(got, content, msg="Exact 2D inclusion assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check types and assertion
	var found = false;
	var size_i, size_j;
	switch (typeof(got)) {
		case "array":
			var arr = got;
			size_i = array_length(arr);
			for (var i = 0; i < size_i && !found; i++) {
				size_j = array_length(arr[i]);
				for (var j = 0; j < size_j; j++) {
					if (content == arr[i][j]) {
						found = true;
						break;
					}
				}
			}
			if (!found) {
				__gma_assert_error_raw__(msg, "A 2D array that contains " + __gma_debug_value__(content), __gma_debug_value__(got));
			}
		break;
		case "number": case "int32": case "int64":
			if (ds_exists(got, ds_type_grid)) {
				var grid = got;
				size_i = ds_grid_width(grid);
				size_j = ds_grid_height(grid);
				for (var i = 0; i < size_i && !found; i++) {
					for (var j = 0; j < size_j; j++) {
						if (content == grid[# i, j]) {
							found = true;
							break;
						}
					}
				}
				if (!found) {
					__gma_assert_error_raw__(msg, "A grid that contains " + __gma_debug_value__(content), __gma_debug_grid_value__(got));
				}
			}
			else {
				msg += " (grid ID does not exist)";
				__gma_assert_error_raw__(msg, "An existent grid ID", __gma_debug_value__(got));
			}
		break;
		default:
			msg += " (invalid container type)";
			__gma_assert_error_raw__(msg, "A grid or 2D array", __gma_debug_value__(got));
		break;
	}
}

///@func assert_doesnt_contain_2d(got, content, msg)
///@param {Array<Array<Any>>,Id.DsGrid} got The actual received value for the assertion
///@param {Any} content A value to look for in the received value
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten grid or 2D array doesn't contain a value equal to content.
function assert_doesnt_contain_2d(got, content, msg="2D non-inclusion assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check types and assertion
	var found = false;
	var size_i, size_j;
	switch (typeof(got)) {
		case "array":
			var arr = got;
			size_i = array_length(arr);
			for (var i = 0; i < size_i && !found; i++) {
				size_j = array_length(arr[i]);
				for (var j = 0; j < size_j; j++) {
					if (__gma_equal__(content, arr[i][j])) {
						found = true;
						break;
					}
				}
			}
			if (found) {
				__gma_assert_error_raw__(msg, "A 2D array that doesn't contain " + __gma_debug_value__(content), __gma_debug_value__(got));
			}
		break;
		case "number": case "int32": case "int64":
			if (ds_exists(got, ds_type_grid)) {
				var grid = got;
				size_i = ds_grid_width(grid);
				size_j = ds_grid_height(grid);
				for (var i = 0; i < size_i && !found; i++) {
					for (var j = 0; j < size_j; j++) {
						if (__gma_equal__(content, grid[# i, j])) {
							found = true;
							break;
						}
					}
				}
				if (found) {
					__gma_assert_error_raw__(msg, "A grid that doesn't contain " + __gma_debug_value__(content), __gma_debug_grid_value__(got));
				}
			}
			else {
				msg += " (grid ID does not exist)";
				__gma_assert_error_raw__(msg, "An existent grid ID", __gma_debug_value__(got));
			}
		break;
		default:
			msg += " (invalid container type)";
			__gma_assert_error_raw__(msg, "A grid or 2D array", __gma_debug_value__(got));
		break;
	}
}

///@func assert_doesnt_contain_exact_2d(got, content, msg)
///@param {Array<Array<Any>>,Id.DsGrid} got The actual received value for the assertion
///@param {Any} content A value to look for in the received value
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten grid or 2D array doesn't contain a value equal to content, as compared using ==.
function assert_doesnt_contain_exact_2d(got, content, msg="Exact 2D non-inclusion assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check types and assertion
	var found = false;
	var size_i, size_j;
	switch (typeof(got)) {
		case "array":
			var arr = got;
			size_i = array_length(arr);
			for (var i = 0; i < size_i && !found; i++) {
				size_j = array_length(arr[i]);
				for (var j = 0; j < size_j; j++) {
					if (content == arr[i][j]) {
						found = true;
						break;
					}
				}
			}
			if (found) {
				__gma_assert_error_raw__(msg, "A 2D array that doesn't contain " + __gma_debug_value__(content), __gma_debug_value__(got));
			}
		break;
		case "number": case "int32": case "int64":
			if (ds_exists(got, ds_type_grid)) {
				var grid = got;
				size_i = ds_grid_width(grid);
				size_j = ds_grid_height(grid);
				for (var i = 0; i < size_i && !found; i++) {
					for (var j = 0; j < size_j; j++) {
						if (content == grid[# i, j]) {
							found = true;
							break;
						}
					}
				}
				if (found) {
					__gma_assert_error_raw__(msg, "A grid that doesn't contain " + __gma_debug_value__(content), __gma_debug_grid_value__(got));
				}
			}
			else {
				msg += " (grid ID does not exist)";
				__gma_assert_error_raw__(msg, "An existent grid ID", __gma_debug_value__(got));
			}
		break;
		default:
			msg += " (invalid container type)";
			__gma_assert_error_raw__(msg, "A grid or 2D array", __gma_debug_value__(got));
		break;
	}
}

///@func assert_doesnt_have_key(got, key, msg)
///@param {Struct,Id.DsMap} got The actual received value for the assertion
///@param {String} key The key that got should not have
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the given struct or map does not have the given key.
function assert_doesnt_have_key(got, key, msg="No-key assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion (struct form)
	if (is_struct(got)) {
		if (variable_struct_exists(got, key)) {
			__gma_assert_error_raw__(msg, "A map or struct without key " + __gma_debug_value__(key), __gma_debug_struct_value__(got));
		}
	}
	//Check assertion (map form)
	else if (is_real(got) || is_int32(got) || is_int64(got)) {
		if (!ds_exists(got, ds_type_map) || ds_map_exists(got, key)) {
			__gma_assert_error_raw__(msg, "A map or struct without key " + __gma_debug_value__(key), __gma_debug_map_value__(got));
		}
	}
	//Invalid
	else {
		__gma_assert_error_raw__(msg, "A map or struct without key " + __gma_debug_value__(key), __gma_debug_value__(got));
	}
}

///@func assert_doesnt_have_method(got, methodName, msg)
///@param {Struct} got The actual received value for the assertion
///@param {String} methodName The method name that got should not have
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the given value does not have a method of the given name.
function assert_doesnt_have_method(got, methodName, msg="No-method assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!is_struct(got) || (variable_struct_exists(got, methodName) && is_method(variable_struct_get(got, methodName)))) {
		__gma_assert_error_raw__(msg, "A struct without a method named " + methodName, __gma_debug_struct_value__(got));
	}
}

///@func assert_has_key(got, key, msg)
///@param {Struct,Id.DsMap} got The actual received value for the assertion
///@param {String} key The key that got should not have
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the given struct or map has the given key.
function assert_has_key(got, key, msg="Key assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion (struct form)
	if (is_struct(got)) {
		if (!variable_struct_exists(got, key)) {
			__gma_assert_error_raw__(msg, "A map or struct with key " + __gma_debug_value__(key), __gma_debug_struct_value__(got));
		}
	}
	//Check assertion (map form)
	else if (is_real(got) || is_int32(got) || is_int64(got)) {
		if (!ds_exists(got, ds_type_map) || !ds_map_exists(got, key)) {
			__gma_assert_error_raw__(msg, "A map or struct with key " + __gma_debug_value__(key), __gma_debug_map_value__(got));
		}
	}
	//Invalid
	else {
		__gma_assert_error_raw__(msg, "A map or struct with key " + __gma_debug_value__(key), __gma_debug_value__(got));
	}
}

///@func assert_has_method(got, methodName, msg)
///@param {Struct} got The actual received value for the assertion
///@param {String} methodName The method name that got should not have
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the given value has a method of the given name.
function assert_has_method(got, methodName, msg="Method assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!is_struct(got) || !variable_struct_exists(got, methodName) || !is_method(variable_struct_get(got, methodName))) {
		__gma_assert_error_raw__(msg, "A struct with a method named " + methodName, __gma_debug_struct_value__(got));
	}
}
