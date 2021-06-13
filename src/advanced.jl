
# Advanced APIs

"""
    askHungryStatus(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks hungry_status.

This method is equivalent to `askAction("hungry_status")`
"""
function askHungryStatus(;
	target_deviceID=nothing,
	target_nickname=nothing,
	timeoutLimit=10)
	askAction("hungry_status",
		target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askSleepyStatus(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks sleepy_status.

This method is equivalent to `askAction("sleepy_status")`

"""
function askSleepyStatus(;
	target_deviceID=nothing,
	target_nickname=nothing,
	timeoutLimit=10)
	askAction("sleepy_status",
		target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end

"""
    askBodyTouchedStatus(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks body_touched_status.

This method is equivalent to `askAction("body_touched_status")`

"""
function askBodyTouchedStatus(;
	target_deviceID=nothing,
	target_nickname=nothing,
	timeoutLimit=10)
	askAction("body_touched_status",
		target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askPawPadsStatus(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks paw_pads_status.

This method is equivalent to `askAction("paw_pads_status")`

"""
function askPawPadsStatus(;
	target_deviceID=nothing,
	target_nickname=nothing,
	timeoutLimit=10)
	askAction("paw_pads_status",
		target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askPostureStatus(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks posture_status.

This method is equivalent to `askAction("posture_status")`

"""
function askPostureStatus(;
	target_deviceID=nothing,
	target_nickname=nothing,
	timeoutLimit=10)
	askAction("posture_status",
		target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askChangePosture(
      finalPosture,
      enquee=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks change_posture.

- `finalPosture` should be one of the following string:
  - `back`
  - `crouch`
  - `down`
  - `down_and_lengthen_behind`
  - `down_and_shorten_behind`
  - `sit_and_raise__both_hands`
  - `sit`
  - `sleep`
  - `stand`
  - `stand_straight`

This method is equivalent to `askAction("change_posture", Dict(FinalPosture=>finalPosture, Enqueue=>enqueue))`

"""
function askChangePosture(
	finalPosture="sit",
	enqueue=false;
	target_deviceID=nothing,
	target_nickname=nothing,
	timeoutLimit=10)
	arguments = Dict("FinalPosture"=> finalPosture)
	if enqueue
		arguments["Enqueue"]=enqueue
	end
	askAction("change_posture", arguments, 
		target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end
