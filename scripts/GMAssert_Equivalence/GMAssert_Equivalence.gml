///@func assert_equal(got, expected, [msg])
///@param {Any} got The actual received value for the assertion
///@param {Any} expected The value expected for the assertion
///@param {String} [msg] (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is equal to the expected expression.
function assert_equal(got, expected, msg="Equal assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!__gma_equal__(got, expected)) {
		__gma_assert_error__(msg, expected, got);
	}
}

///@func assert_equalish(got, expected, [msg])
///@param {Any} got The actual received value for the assertion
///@param {Any} expected The value expected for the assertion
///@param {String} [msg] (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is approximately equal to the expected expression.
function assert_equalish(got, expected, msg="Equalish assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!__gma_equalish__(got, expected)) {
		__gma_assert_error__(msg, expected, got);
	}
}

///@func assert_is(got, expected, [msg])
///@param {Any} got The actual received value for the assertion
///@param {Any} expected The value expected for the assertion
///@param {String} [msg] (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is exactly equal to the expected expression (as compared using ==).
function assert_is(got, expected, msg="Exact equal assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (typeof(got) != typeof(expected) || got != expected) {
		__gma_assert_error__(msg, expected, got);
	}
}

///@func assert_not_equal(got, expected, [msg])
///@param {Any} got The actual received value for the assertion
///@param {Any} expected The value expected for the assertion
///@param {String} [msg] (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is not equal to the expected expression.
function assert_not_equal(got, expected, msg="Not equal assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (__gma_equal__(got, expected)) {
		__gma_assert_error__(msg, expected, got);
	}
}

///@func assert_not_equalish(got, expected, [msg])
///@param {Any} got The actual received value for the assertion
///@param {Any} expected The value expected for the assertion
///@param {String} [msg] (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is not approximately equal to the expected expression.
function assert_not_equalish(got, expected, msg= "Not equalish assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (__gma_equalish__(got, expected)) {
		__gma_assert_error__(msg, expected, got);
	}
}

///@func assert_isnt(got, expected, [msg])
///@param {Any} got The actual received value for the assertion
///@param {Any} expected The value expected for the assertion
///@param {String} [msg] (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is not exactly equal to the expected expression (as compared using ==).
function assert_isnt(got, expected, msg="Not equal assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (typeof(got) == typeof(expected) && got == expected) {
		__gma_assert_error__(msg, expected, got);
	}
}
