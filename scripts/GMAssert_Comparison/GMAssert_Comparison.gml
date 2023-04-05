///@func assert_greater_than(got, expected, msg)
///@param {Real,String,Array} got The actual received value for the assertion
///@param {Real,String,Array} expected The value expected for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is greater than the expected expression.
function assert_greater_than(got, expected, msg="Greater than assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!__gma_greater_than__(got, expected)) {
		switch (typeof(expected)) {
			case "number":
				__gma_assert_error_raw__(msg, "A real value greater than " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			case "string":
				__gma_assert_error_raw__(msg, "A string that comes after " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			case "array":
				__gma_assert_error_raw__(msg, "An array with pairwise values all greater than " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			default:
				__gma_assert_error__(msg + " (unsupported type)", expected, got);
			break;
		}
	}
}

///@func assert_less_than(got, expected, msg)
///@param {Real,String,Array} got The actual received value for the assertion
///@param {Real,String,Array} expected The value expected for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is less than the expected expression.
function assert_less_than(got, expected, msg="Less than assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!__gma_less_than__(got, expected)) {
		switch (typeof(expected)) {
			case "number":
			__gma_assert_error_raw__(msg, "A real value less than " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			case "string":
			__gma_assert_error_raw__(msg, "A string that comes before " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			case "array":
			__gma_assert_error_raw__(msg, "An array with pairwise values all less than " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			default:
			__gma_assert_error__(msg + " (unsupported type)", expected, got);
			break;
		}
	}
}

///@func assert_greater_than_or_equal(got, expected, msg)
///@param {Real,String,Array} got The actual received value for the assertion
///@param {Real,String,Array} expected The value expected for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is greater than or equal to the expected expression.
function assert_greater_than_or_equal(got, expected, msg="Greater than or equal assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!__gma_greater_than_or_equal__(got, expected)) {
		switch (typeof(expected)) {
			case "number":
				__gma_assert_error_raw__(msg, "A real value greater than or equal to " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			case "string":
				__gma_assert_error_raw__(msg, "A string that comes after or is " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			case "array":
				__gma_assert_error_raw__(msg, "An array with pairwise values all greater than or equal to " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			default:
				__gma_assert_error__(msg + " (unsupported type)", expected, got);
			break;
		}
	}
}

///@func assert_less_than_or_equal(got, expected, msg)
///@param {Real,String,Array} got The actual received value for the assertion
///@param {Real,String,Array} expected The value expected for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is less than or equal to the expected expression.
function assert_less_than_or_equal(got, expected, msg="Less than or equal assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!__gma_less_than_or_equal__(got, expected)) {
		switch (typeof(expected)) {
			case "number":
			__gma_assert_error_raw__(msg, "A real value less than or equal to " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			case "string":
			__gma_assert_error_raw__(msg, "A string that comes before or is " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			case "array":
			__gma_assert_error_raw__(msg, "An array with pairwise values all less than or equal " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			default:
			__gma_assert_error__(msg + " (unsupported type)", expected, got);
			break;
		}
	}
}
