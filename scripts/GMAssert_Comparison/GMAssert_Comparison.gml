///@func assert_greater_than(got, expected, msg)
///@param {Real,String,Array,Struct} got The actual received value for the assertion
///@param {Real,String,Array,Struct} expected The value expected for the assertion
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
			case "struct":
				__gma_assert_error_raw__(msg, "A struct with corresponding values all greater than " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			default:
				__gma_assert_error__(msg + " (unsupported type)", expected, got);
			break;
		}
	}
}

///@func assert_less_than(got, expected, msg)
///@param {Real,String,Array,Struct} got The actual received value for the assertion
///@param {Real,String,Array,Struct} expected The value expected for the assertion
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
			case "struct":
				__gma_assert_error_raw__(msg, "A struct with corresponding values all less than " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			default:
			__gma_assert_error__(msg + " (unsupported type)", expected, got);
			break;
		}
	}
}

///@func assert_greater_than_or_equal(got, expected, msg)
///@param {Real,String,Array,Struct} got The actual received value for the assertion
///@param {Real,String,Array,Struct} expected The value expected for the assertion
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
			case "struct":
				__gma_assert_error_raw__(msg, "A struct with corresponding values all greater than or equal to " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			default:
				__gma_assert_error__(msg + " (unsupported type)", expected, got);
			break;
		}
	}
}

///@func assert_less_than_or_equal(got, expected, msg)
///@param {Real,String,Array,Struct} got The actual received value for the assertion
///@param {Real,String,Array,Struct} expected The value expected for the assertion
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
			__gma_assert_error_raw__(msg, "An array with pairwise values all less than or equal to " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			case "struct":
				__gma_assert_error_raw__(msg, "A struct with corresponding values all less than or equal to " + __gma_debug_value__(expected), __gma_debug_value__(got));
			break;
			default:
			__gma_assert_error__(msg + " (unsupported type)", expected, got);
			break;
		}
	}
}

///@func assert_in_range(got, lower, upper, msg)
///@param {Real,String,Array,Struct} got The actual received value for the assertion
///@param {Real,String,Array,Struct} lower The lower bound of the range (inclusive)
///@param {Real,String,Array,Struct} upper The upper bound of the range (inclusive)
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is within the inclusive range between lower and upper.
function assert_in_range(got, lower, upper, msg="In-range assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check types
	switch (typeof(lower)) {
		case "number":
		case "string":
		case "array":
		case "struct":
		break;
		default:
			msg += " (invalid lower bound type)";
			__gma_assert_error_raw__(msg, "A real value, string, array, or struct", __gma_debug_value__(lower));
		exit;
	}
	if (typeof(lower) != typeof(upper)) {
		switch (typeof(lower)) {
			case "number":
				__gma_assert_error__(msg + " (mismatched range types)", "A real value for the upper bound", __gma_debug_value__(upper));
			break;
			case "string":
				__gma_assert_error__(msg + " (mismatched range types)", "A string for the upper bound", __gma_debug_value__(upper));
			break;
			case "array":
				__gma_assert_error__(msg + " (mismatched range types)", "An array for the upper bound", __gma_debug_value__(upper));
			break;
			case "struct":
				__gma_assert_error__(msg + " (mismatched range types)", "A struct for the upper bound", __gma_debug_value__(upper));
			break;
			default:
				msg += " (invalid lower bound type)";
				__gma_assert_error_raw__(msg, "A real value, string, array, or struct", __gma_debug_value__(lower));
			break;
		}
		exit;
	}
	//Check assertion
	if (!(__gma_less_than_or_equal__(got, upper) && __gma_less_than_or_equal__(lower, got))) {
		switch (typeof(lower)) {
			case "number":
				__gma_assert_error_raw__(msg, "A real value between " + __gma_debug_value__(lower) + " and " + __gma_debug_value__(upper), __gma_debug_value__(got));
			break;
			case "string":
			__gma_assert_error_raw__(msg, "A string that lies between " + __gma_debug_value__(lower) + " and " + __gma_debug_value__(upper), __gma_debug_value__(got));
				break;
			case "array":
				__gma_assert_error_raw__(msg, "An array with pairwise values all between " + __gma_debug_value__(lower) + " and " + __gma_debug_value__(upper), __gma_debug_value__(got));
			break;
			case "struct":
				__gma_assert_error_raw__(msg, "A struct with corresponding values all between " + __gma_debug_value__(lower) + " and " + __gma_debug_value__(upper), __gma_debug_value__(got));
			break;
			default:
				__gma_assert_error_raw__(msg + " (unsupported type)", "A value comparable to " + __gma_debug_value__(lower) + " and " + __gma_debug_value__(upper), __gma_debug_value__(got));
			break;
		}
	}
}

///@func assert_not_in_range(got, lower, upper, msg)
///@param {Real,String,Array,Struct} got The actual received value for the assertion
///@param {Real,String,Array,Struct} lower The lower bound of the range (inclusive)
///@param {Real,String,Array,Struct} upper The upper bound of the range (inclusive)
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is not within the inclusive range between lower and upper.
function assert_not_in_range(got, lower, upper, msg="Out-of-range assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check types
	switch (typeof(lower)) {
		case "number":
		case "string":
		case "array":
		case "struct":
		break;
		default:
			msg += " (invalid lower bound type)";
			__gma_assert_error_raw__(msg, "A real value, string, array, or struct", __gma_debug_value__(lower));
		exit;
	}
	if (typeof(lower) != typeof(upper)) {
		switch (typeof(lower)) {
			case "number":
				__gma_assert_error__(msg + " (mismatched range types)", "A real value for the upper bound", __gma_debug_value__(upper));
			break;
			case "string":
				__gma_assert_error__(msg + " (mismatched range types)", "A string for the upper bound", __gma_debug_value__(upper));
			break;
			case "array":
				__gma_assert_error__(msg + " (mismatched range types)", "An array for the upper bound", __gma_debug_value__(upper));
			break;
			case "struct":
				__gma_assert_error__(msg + " (mismatched range types)", "A struct for the upper bound", __gma_debug_value__(upper));
			break;
			default:
				msg += " (invalid lower bound type)";
				__gma_assert_error_raw__(msg, "A real value, string, array, or struct", __gma_debug_value__(lower));
			break;
		}
		exit;
	}
	//Check assertion
	if (__gma_less_than_or_equal__(got, upper) && __gma_less_than_or_equal__(lower, got)) {
		switch (typeof(lower)) {
			case "number":
				__gma_assert_error_raw__(msg, "A real value not between " + __gma_debug_value__(lower) + " and " + __gma_debug_value__(upper), __gma_debug_value__(got));
			break;
			case "string":
				__gma_assert_error_raw__(msg, "A string that does not lie between " + __gma_debug_value__(lower) + " and " + __gma_debug_value__(upper), __gma_debug_value__(got));
			break;
			case "array":
				__gma_assert_error_raw__(msg, "An array with pairwise values all not between " + __gma_debug_value__(lower) + " and " + __gma_debug_value__(upper), __gma_debug_value__(got));
			break;
			case "struct":
				__gma_assert_error_raw__(msg, "A struct with corresponding values all not between " + __gma_debug_value__(lower) + " and " + __gma_debug_value__(upper), __gma_debug_value__(got));
			break;
			default:
				__gma_assert_error_raw__(msg + " (unsupported type)", "A value comparable to " + __gma_debug_value__(lower) + " and " + __gma_debug_value__(upper), __gma_debug_value__(got));
			break;
		}
	}
}
