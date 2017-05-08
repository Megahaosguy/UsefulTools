local component = require("component")
local robot = require("robot")
local term = require("term")
local rs = require("redstone")
local inputSignal

function waitAndPlace()
   while true do
      os.sleep(1)
	  if (rs.getInput(sides.up) > 0)
	     robot.placeDown()
	  end
   end
end

waitAndPlace()
