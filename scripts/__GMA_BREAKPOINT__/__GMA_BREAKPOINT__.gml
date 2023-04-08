///@function __GMA_BREAKPOINT__
///@param {String} message The error message about to be displayed
///@param {Any} got The value received by the failing assertion
///@param {Any} expected The value expected by the failing assertion
///@return {Bool}
///@ignore
///@desc A script that runs just before the error popup in a failed assertion. Return true to bypass the error popup, false to allow it.
function __GMA_BREAKPOINT__(message, got, expected) {
	// Place a breakpoint below
	var __GMA_MY_BREAKPOINT__ = true;
  
	/* Additional assertion failure handling behaviours here */
  
	// Return true to bypass error popup, false otherwise
	return false;
}
