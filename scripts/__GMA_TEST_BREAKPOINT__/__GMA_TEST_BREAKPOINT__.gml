///@function __GMA_TEST_BREAKPOINT__
///@param {String} message The error message about to be displayed
///@param {Any} got The value received by the failing assertion
///@param {Any} expected The value expected by the failing assertion
///@return {Bool}
///@ignore
///@desc (INTERNAL: GMAssert 2) A script that runs just before the error popup in a failed assertion.
function __GMA_TEST_BREAKPOINT__(message, got, expected) {
	// This is for the self-test only
	// Extension default has a dummy line here instead
	global.__gma_assert_triggered__ = true;

	// Return true to bypass error popup, false otherwise
	return true;
}
