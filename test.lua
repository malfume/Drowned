-- Test.lua
local Test = {}

-- This is a helper function that you want to test
function Test.helperFunction(a, b)
  return a + b
end

-- This is a test function that checks if the helper function returns the correct result
function Test.testHelperFunction()
  local result = Test.helperFunction(1, 2)
  assert(result == 3, "Expected 1 + 2 to equal 3, but got " .. tostring(result))
end

-- This is a test function that checks if the helper function throws an error when given invalid arguments
function Test.testHelperFunctionInvalidArguments()
  local status, err = pcall(Test.helperFunction, "1", 2)
  assert(not status and err:find("bad argument #1"), "Expected an error when passing a string as the first argument, but got " .. tostring(err))
end

-- This function runs all the tests
function Test.runTests()
  Test.testHelperFunction()
  Test.testHelperFunctionInvalidArguments()
end

-- Run the tests
Test.runTests()
