///@func assert_is_string(got, msg)
///@param {Any} got The actual received value for the assertion
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
///@param {Any} got The actual received value for the assertion
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
///@param {Any} got The actual received value for the assertion
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
///@param {Any} got The actual received value for the assertion
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
///@param {Any} got The actual received value for the assertion
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
