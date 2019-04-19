/// @description test_case_trigger(assert, [msg])
/// @param assert
/// @param [msg]
{
  global.__gma_case_count__++;
  
  //Capture message argument
  var msg;
  switch (argument_count) {
    case 1:
      msg = "Should have triggered assertion, but didn't!";
    break;
    case 2:
      msg = argument[1];
    break;
    default:
      show_error("Expected 1 or 2 arguments, got " + string(argument_count) + ".", true);
    break;
  }
  
  //Check assertion
  if (global.__gma_assert_triggered__) {
    show_debug_message("Test case " + string(global.__gma_case_count__) + ": PASS");
  }
  else {
    show_debug_message("Test case " + string(global.__gma_case_count__) + ": FAIL");
    global.__gma_fail_count__++;
    global.__gma_test_time__ += current_time-global.__gma_test_time_start__;
    var msg = "Test case " + string(global.__gma_case_count__) + " failed!";
    if (os_browser == browser_not_a_browser) {
      show_error(msg, false);
    }
    else {
      show_message(msg);
    }
    global.__gma_test_time_start__ = current_time;
  }
  global.__gma_assert_triggered__ = false;
}
