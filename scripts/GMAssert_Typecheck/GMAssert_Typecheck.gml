///@func assert_is_string(got, msg)
///@param {String} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is a string.
function assert_is_string(got, msg="String type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!is_string(got)) {
		__gma_assert_error_raw__(msg, "Any string", __gma_debug_value__(got));
	}
}

///@func assert_is_real(got, msg)
///@param {Real} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is a real number.
function assert_is_real(got, msg="Real type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!is_real(got)) {
		__gma_assert_error_raw__(msg, "Any real value", __gma_debug_value__(got));
	}
}

///@func assert_is_array(got, msg)
///@param {Array} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is an array.
function assert_is_array(got, msg="Array type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!is_array(got)) {
		__gma_assert_error_raw__(msg, "Any array", __gma_debug_value__(got));
	}
}

///@func assert_is_defined(got, msg)
///@param {Any} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is not undefined.
function assert_is_defined(got, msg="Defined type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (is_undefined(got)) {
		__gma_assert_error_raw__(msg, "Anything but undefined", __gma_debug_value__(got));
	}
}

///@func assert_is_undefined(got, msg)
///@param {Undefined} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc  
function assert_is_undefined(got, msg="Undefined type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!is_undefined(got)) {
		__gma_assert_error_raw__(msg, "undefined", __gma_debug_value__(got));
	}
}

///@func assert_isnt_string(got, msg)
///@param {Any} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is not a string.
function assert_isnt_string(got, msg="Non-string type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (is_string(got)) {
		__gma_assert_error_raw__(msg, "Anything but a string", __gma_debug_value__(got));
	}
}

///@func assert_isnt_real(got, msg)
///@param {Any} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is not a real number.
function assert_isnt_real(got, msg="Non-real type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (is_real(got)) {
		__gma_assert_error_raw__(msg, "Anything but a real value", __gma_debug_value__(got));
	}
}

///@func assert_isnt_array(got, msg)
///@param {Any} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is not an array.
function assert_isnt_array(got, msg="Non-array type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (is_array(got)) {
		__gma_assert_error_raw__(msg, "Anything but an array", __gma_debug_value__(got));
	}
}

///@func assert_isnt_defined(got, msg)
///@param {Undefined} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is undefined.
function assert_isnt_defined(got, msg="Undefined type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!is_undefined(got)) {
		__gma_assert_error_raw__(msg, "undefined", __gma_debug_value__(got));
	}
}

///@func assert_isnt_undefined(got, msg)
///@param {Any} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is not undefined.
function assert_isnt_undefined(got, msg="Defined type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (is_undefined(got)) {
		__gma_assert_error_raw__(msg, "Anything but undefined", __gma_debug_value__(got));
	}
}

///@func assert_is_struct(got, msg)
///@param {Struct} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is a struct.
function assert_is_struct(got, msg="Struct type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!is_struct(got)) {
		__gma_assert_error_raw__(msg, "Any struct", __gma_debug_value__(got));
	}
}

///@func assert_is_instance_of(got, typeName, msg)
///@param {Any} got The actual received value for the assertion
///@param {String} typeName The type that the given value should have
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the given value has the given type.
function assert_is_instance_of(got, typeName, msg="Instance-of assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (typeof(got) != typeName && (!is_struct(got) || instanceof(got) != typeName)) {
		__gma_assert_error_raw__(msg, "Anything of type " + typeName, __gma_debug_value__(got));
	}
}

///@func assert_is_method(got, msg)
///@param {Function} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is a method.
function assert_is_method(got, msg="Function type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!is_method(got)) {
		__gma_assert_error_raw__(msg, "Any method", __gma_debug_value__(got));
	}
}

///@func assert_isnt_struct(got, msg)
///@param {Any} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is not a struct.
function assert_isnt_struct(got, msg="Non-struct type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (is_struct(got)) {
		__gma_assert_error_raw__(msg, "Anything but a struct", __gma_debug_value__(got));
	}
}

///@func assert_isnt_instance_of(got, typeName, msg)
///@param {Any} got The actual received value for the assertion
///@param {String} typeName The type that the given value should not have
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the given value does not have the given type.
function assert_isnt_instance_of(got, typeName, msg="Not-instance-of assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (typeof(got) == typeName || (is_struct(got) && instanceof(got) == typeName)) {
		__gma_assert_error_raw__(msg, "Anything not of type " + typeName, __gma_debug_value__(got));
	}
}

///@func assert_isnt_method(got, msg)
///@param {Any} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is not a method.
function assert_isnt_method(got, msg="Non-function type assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (is_method(got)) {
		__gma_assert_error_raw__(msg, "Anything but a method", __gma_debug_value__(got));
	}
}
