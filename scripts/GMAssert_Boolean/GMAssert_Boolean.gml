///@func assert(got, msg)
///@param {Any} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is true.
function assert(got, msg="Assertion failed!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (!got) {
		__gma_assert_error_simple__(msg, got);
	}
}

///@func assert_fail(got, msg)
///@param {Any} got The actual received value for the assertion
///@param {String} msg (optional) A custom message to display when the assertion fails
///@desc Assert that the gotten expression is false.
function assert_fail(got, msg="Assertion didn't fail!") {
	if (!GMASSERT_ENABLED) exit;
	//Check assertion
	if (got) {
		__gma_assert_error_simple__(msg, got);
	}
}
