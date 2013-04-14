#!/usr/bin/env lua

local lfs = require"lfs"
require "list"

local function bfs_with(path, fun_file)
   local sep = string.match (package.config, "[^\n]+")
   Q = list.new()

   for file in lfs.dir(path) do
	 if file ~= "." and file ~= ".." then
	    local f = path..sep..file
	    local attr = lfs.attributes(f)
	    if attr.mode == "directory" then
	       list.pushright(Q, f)
	    else
	       fun_file(f)
	    end
	 end
   end   
   while list.size(Q) > 0 do
      p = list.popleft(Q)
      for file in lfs.dir(p) do
	 if file ~= "." and file ~= ".." then
	    local f = p..sep..file
	    local attr = lfs.attributes(f)
	    if attr.mode == "directory" then
	       list.pushright(Q, f)
	    else
	       fun_file(f)
	    end
	 end
      end         
   end
end

bfs_with("/tmp", print)
