///@func test_case_trigger(assertion, [msg])
///@arg assertion The assertion call expression
///@arg {String} [msg] The message to display on failure
///@desc Check that the assertion is triggered.
function test_case_trigger(assertion, msg="Test case "+string(global.__gma_case_count__+1)+" failed!") {
	global.__gma_case_count__++;
  
	//Check assertion
	if (global.__gma_assert_triggered__) {
		show_debug_message("Test case " + string(global.__gma_case_count__) + ": PASS");
	} else {
		show_debug_message("Test case " + string(global.__gma_case_count__) + ": FAIL (" + msg + ")");
		global.__gma_fail_count__++;
		///Feather disable GM1041
		ds_list_add(global.__gma_fail_list__, msg);
		///Feather enable GM1041
		global.__gma_test_time__ += current_time-global.__gma_test_time_start__;
		if (os_browser == browser_not_a_browser) {
			show_error(msg, false);
		} else {
			show_message(msg);
		}
		global.__gma_test_time_start__ = current_time;
	}
	global.__gma_assert_triggered__ = false;
}
