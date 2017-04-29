local component = require("component")
local robot = require("robot")
local term = require("term")
local placesMoved = 0

robot.detect()
local function goForward()
   while not robot.detect() do
      robot.forward()
   end
end

local function placeItThere()
   robot.select(1)
   robot.back()
   robot.place()
   robot.up()
   robot.select(2)
   robot.place()
   robot.down()
end

local function placeItDown(distance)
   for i = 1, distance do
      robot.forward()
   end
   while not robot.detectDown() do
      placesMoved = placesMoved + 1
	  robot.down()
   end
   robot.up()
   robot.select(1)
   robot.placeDown()
   robot.up()
   robot.select(2)
   robot.placeDown()
   io.write('# places moved = ', placesMoved)
   for i = 3, placesMoved do
      robot.up()
   end
   robot.turnAround()
   for i = 1, distance do
      robot.forward()
   end
   robot.turnAround()
end

local function placeItUp(distance)
   for i = 1, distance do
      robot.forward()
   end
   while not robot.detectUp() do
      placesMoved = placesMoved + 1
	  robot.Up()
   end
   robot.down()
   robot.select(1)
   robot.placeUp()
   robot.down()
   robot.select(2)
   robot.placeUp()
   io.write('# places moved = ', placesMoved)
   for i = 3, placesMoved do
      robot.down()
   end
   robot.turnAround()
   for i = 1, distance do
      robot.forward()
   end
   robot.turnAround()
end

local function regular()
   goForward()
   placeItThere()
   robot.turnAround()
   goForward()
end

local function topBar()
   term.clear()
   io.write('#################\n')
   io.write('# DOIT-GUI   V1 #\n')
   io.write('#################\n')
end

function input(inputValue)
   if inputValue == '1' then
      placeItThere()
   elseif inputValue == '2' then
      io.write('# How far away?')
	  local distance1 = io.read()
      placeItDown(distance1)
   elseif inputValue == '3' then
      io.write('# How far away?')
	  local distance2 = io.read()
      placeItUp(distance2)
   else
      init()
   end
end

local function init()
   topBar()
   io.write('#\n')
   io.write('# 1. Forward\n')
   io.write('# 2. Forward then Down\n')
   io.write('# 3. Forward then Up\n')
   io.write('#\n')
   io.write('#: ')
   local inputValue = io.read()
   input(inputValue)
end


init()