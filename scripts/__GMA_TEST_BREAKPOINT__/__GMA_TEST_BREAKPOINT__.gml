{
  var message = argument[0],
      got = argument[1],
      expected = argument[2];
  
  // This is for the self-test only
  // Extension default has a dummy line here instead
  global.__gma_assert_triggered__ = true;
  
  // Return true to bypass error popup, false otherwise
  return true;
}
