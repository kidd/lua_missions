--[[
  EXERCISE: Monkey-patching strings

  With all you have learnt now, you should be able to do this exercise

  Add the necessary code below so that the test at the end passes

]]

-- INSERT YOUR CODE HERE

ns = {}
function ns.starts_with(str, s)
	 local l = #s
	 return str:sub(1, l)
end

function ns.ends_with(str, s)
	 local l = #s
	 return str:sub((-l), -1)
end


getmetatable("").__index.starts_with = ns.starts_with
getmetatable("").__index.ends_with = ns.ends_with

-- END OF CODE INSERT

function test_starts_with()
  local str = "Lua is awesome"

  assert_true(str:starts_with("L"))
  assert_true(str:starts_with("Lua"))
  assert_true(str:starts_with("Lua is"))
end

function test_ends_with()
  local str = "Lua is awesome"

  assert_true(str:ends_with("e"))
  assert_true(str:ends_with("some"))
  assert_true(str:ends_with("awesome"))
end

-- hint: string == getmetatable("").__index
