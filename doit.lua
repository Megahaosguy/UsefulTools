local component = require("component")
local robot = require("robot")

robot.detect()
local function goForward()
   while not robot.detect() do
      robot.forward()
   end
end

local function placeItDown()
   robot.select(1)
   robot.back()
   robot.place()
   robot.up()
   robot.select(2)
   robot.place()
   robot.down()
end


goForward()
placeItDown()
robot.turnAround()
goForward()