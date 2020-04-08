/// @description test_case(got, [expected], [msg])
/// @param got
/// @param [expected]
/// @param [msg]
function test_case() {
	global.__gma_case_count__++;
  
	var result, msg;
	switch (argument_count) {
		case 3:
			msg = "Test case " + string(global.__gma_case_count__) + " failed!";
		case 2:
			result = __gma_debug_value__(argument[0]) == __gma_debug_value__(argument[1]) && argument[0] == argument[1]; 
		break;
		case 1:
			result = argument[0];
		break;
		default:
			show_error("Expected 1-3 arguments, got " + string(argument_count) + ".", true);
		break;
	}
	if (result) {
		show_debug_message("Test case " + string(global.__gma_case_count__) + ": PASS");
	} else {
		show_debug_message("Test case " + string(global.__gma_case_count__) + ": FAIL");
		global.__gma_fail_count__++;
		global.__gma_test_time__ += current_time-global.__gma_test_time_start__; 
		if (os_browser == browser_not_a_browser) {
			show_error(msg, true);
		}
		else {
			show_message(msg);
		}
		global.__gma_test_time_start__ = current_time;
	}
}
