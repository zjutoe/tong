-- local modname = ...
-- local M = {}
-- _G[modname] = M
-- package.loaded[modname] = M
-- setmetatable(M, {__index = _G})
-- setfenv(1, M)


-- List
-- from http://www.lua.org/pil/11.4.html
-- this is the module to implement a list data structure
-- [toe] I'm not sure about its license, assuming MIT and will license
-- other parts of this software as MIT. Please let me know if it's not
-- MIT...


local function new ()
   return {first = 0, last = -1}
end

local function pushleft (list, value)
      local first = list.first - 1
      list.first = first
      list[first] = value
end
    
local function pushright (list, value)
      local last = list.last + 1
      list.last = last
      list[last] = value
end

local function popleft (list)
   local first = list.first
   if first > list.last then return nil end -- error("list is empty") end
   local value = list[first]
   list[first] = nil        -- to allow garbage collection
   list.first = first + 1
   return value
end
    
local function popright (list)
   local last = list.last
   if list.first > last then return nil end -- error("list is empty") end
   local value = list[last]
   list[last] = nil         -- to allow garbage collection
   list.last = last - 1
   return value
end

local function size(list)
   return list.last - list.first + 1
end

list = {
   size = size,
   popright = popright,
   popleft = popleft,
   pushright = pushright,
   pushleft = pushleft,
   new = new,
}
