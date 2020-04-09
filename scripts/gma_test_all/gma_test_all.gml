/// @description gma_test_all()
function gma_test_all() {
	//Initialize tracking variables
	global.__gma_case_count__ = 0;
	global.__gma_fail_count__ = 0;
	global.__gma_assert_triggered__ = false;
	global.__gma_test_time__ = 0;
	global.__gma_fail_list__ = ds_list_create();
  
	//Start timer
	global.__gma_test_time_start__ = current_time;
  
	//TESTS
	if (GMASSERT_ENABLED) {
		__gma_test_debug_type__();
		__gma_test_debug_value__();
    __gma_test_debug_value_23__();
		__gma_test_trigger_messages__();
		__gma_test_trigger_messages_23__();
	}
  
	//Print result
	if (GMASSERT_ENABLED) {
		show_debug_message(string(global.__gma_case_count__) + " tests completed in " + string(current_time-global.__gma_test_time_start__) + "ms.");
		show_debug_message(string(global.__gma_case_count__-global.__gma_fail_count__) + " passed, " + string(global.__gma_fail_count__) + " failed (" + string((1-global.__gma_fail_count__/global.__gma_case_count__)*100) + "%)");
		if (global.__gma_fail_count__ > 0) {
			show_debug_message("Failed tests:");
			for (var i = 0; i < global.__gma_fail_count__; ++i) {
				show_debug_message("- " + global.__gma_fail_list__[| i]);
			}
		}
	} else {
		show_debug_message("Warning: Tests skipped because GMAssert is disabled.");
	}
	if (os_browser == browser_not_a_browser) {
		game_end();
	} else if (GMASSERT_ENABLED) {
		if (global.__gma_fail_count__ == 0) {
			__background_set_colour( c_green );
		} else {
			__background_set_colour( c_red );
		}
	}
}
