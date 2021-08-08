
# Advanced APIs

export 
   askSetMode, askHungryStatus, askSleepyStatus,
   askPawPadsStatus,
   askBodyTouchedStatus,
   askPostureStatus, askChangePosture, askMoveHead, askStay,
   askBitingStatus, askPlayBone, askPlayDice, askPlayMotion,
   askNameCalledStatus, askVoiceCommandStatus,
   askApproachPerson, askChasePerson, askFindPerson,
   askExplore, askMoveToPosition,
   askTurnAround, askMoveAlongCircle, askMoveDirection,
   askMoveForward, askMoveSideways,
   askFoundObjectsStatus, askApproachObject, askChaseObject, 
   askFindObject, askGetCloseToObject,
   askKickObject, askReleaseObject

## Status related APIs

"""
    askSetMode(
      modeName="NORMAL";
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `set_mode`.

- `askSetMode` should be one of the following strings:
  - `NORMAL`
  - `DEVELOPMENT`

This method is equivalent to `askAction("set_mode", Dict(ModeName=>modeName, Enqueue=>enqueue))`

"""
function askSetMode(
   modeName="NORMAL";
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   arguments = Dict("ModeName"=> modeName)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("set_mode", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askHungryStatus(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `hungry_status`.

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

asks `sleepy_status`.

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

asks `body_touched_status`.

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

asks `paw_pads_status`.

This method is equivalent to `askAction("paw_pads_status")`

"""
function askPawPadsStatus(;
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   askAction("paw_pads_status",
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end

## Posture related APIs

"""
    askPostureStatus(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `posture_status`.

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
      finalPosture="sit";
      enquee=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `change_posture`.

- `finalPosture` should be one of the following constants:
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
   finalPosture="sit";
   enqueue=false,
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


"""
    askMoveHead(;
      azimuth=0,
      elevation=0,
      velocity=0,
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `move_head`.

- `azimuth` : -80 -- 80 (degree)
- `elevation` : -40 -- 40 (degree)
- `velocity` : 10 -- 80 (deg/sec)

This method is equivalent to `askAction("move_head", Dict(Duration=>duration, Enqueue=>enqueue))`

"""
function askMoveHead(;
   azimuth=0,
   elevation=0,
   velocity=0,
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict(
      "Azimuth" => azimuth,
      "elevation" => elevation,
      "Velocity" => velocity)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("move_head", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askStay(;
      duration=60,
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `stay` for `duration` seconds.

- `duration` : 0--360 (seconds)

This method is equivalent to `askAction("stay", Dict(Duration=>duration, Enqueue=>enqueue))`

"""
function askStay(;
   duration=60,
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict("Duration"=> duration)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("stay", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end

## Play related APIs


"""
    askBitingStatus(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `biting_status`.

This method is equivalent to `askAction("biting_status")`

"""
function askBitingStatus(;
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   askAction("biting_status",
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askPlayBone(
      category="holdMouth";
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `play_bone`.


This method is equivalent to `askAction("play_bone", Dict(Category=>holdMouth, Enqueue=>enqueue))`

"""
function askPlayBone(
   category="holdMouth";
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   arguments = Dict("Category"=> category)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("play_bone", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askPlayDice(
      category="holdMouthDice";
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `change_posture`.

- `category` should be one of the following constants:
  - `holdMouthDice`
  - `rollDiceLeft`
  - `rollDiceRight`
  - `rollDicePush`
  - `rollDicePull`
  - `stackDice`

This method is equivalent to `askAction("play_dice", Dict(Category=>category, Enqueue=>enqueue))`

"""
function askPlayDice(
   category="holdMouthDice";
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   arguments = Dict("Category"=> category)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("play_dice", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askPlayMotion(
      category="agree";
      enqueue=false,
      mode="NONE",
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `play_motion`.

- `category` should be one of the following constants. Optional `Mode` parameters other than "NONE" are also listed.
  - `agree`
  - `bad`
  - `bark`
  - `beckon`
    - `Mode`: `BODY_LEFT`
    - `Mode`: `BODY_RIGHT`
  - `belch`
  - `bentBack`
  - `breath`
  - `curious`
  - `dance`
  - `drawInOnesChin`
  - `dreaming`
  - `friendly`
  - `friendlyPolite`
  - `gasp`
  - `halfAsleep`
  - `handsUp`
  - `happyOrHot`
  - `heading`
    - `Mode`: `NONE`
    - `Mode`: `SPACE_LEFT`
    - `Mode`: `SPACE_RIGHT`
  - `helloIloveYou`
  - `highFive`
    - `Mode`: `NONE`
    - `Mode`: `BODY_LEFT`
    - `Mode`: `BODY_RIGHT`
  - `imFriendly`
  - `jiggle`
  - `kiss`
  - `lickBody`
    - `Mode`: `BODY_LEFT`
    - `Mode`: `BODY_RIGHT`

  - `lookAroundHead`
  - `lookOver`
  - `marking`
    - `Mode`: `BOY`
    - `Mode`: `GIRL`
  - `nodHead`
  - `openMouth`
  - `overJoyed`
  - `paw`
    - `Mode`: `BODY_LEFT`
    - `Mode`: `BODY_RIGHT`
  - `peace`
    - `Mode`: `SPACE_LEFT`
    - `Mode`: `SPACE_RIGHT`
  - `perceive`
  - `playBiting`
  - `prettyPlease`
  - `ready`
  - `relax`
  - `restless`
  - `rubBack`
  - `scratchFloor`
  - `scratchHead`
    - `Mode`: `HIND_LEFT`
    - `Mode`: `HIND_RIGHT`
  - `shakeHead`
  - `shakeHipsBehind`
  - `shudder`
  - `sideKick`
    - `Mode`: `FRONT_LEFT`
    - `Mode`: `FRONT_RIGHT`
  - `sideUp`
    - `Mode`: `BODY_LEFT`
    - `Mode`: `BODY_RIGHT`
  - `sing`
  - `sleepTalking`
  - `sneeze`
  - `sniff`
  - `sniffDown`
  - `sniffUp`
  - `startled`
  - `startledLittle`
  - `stretch`
  - `swing`
  - `touched`
    - `Mode`: `SPACE_CENTER`
  - `waiting`
  - `washFace`
  - `whine`
  - `wiggleEar`
    - `Mode` : `BODY_BOTH`
  - `woof`
  - `yap`
  - `yawn`

This method is equivalent to `askAction("play_motion", Dict(Category=>category, Mode=>mode, Enqueue=>enqueue))`

"""
function askPlayMotion(
   category="agree";
   enqueue=false,
   mode="NONE",
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   arguments = Dict(
      "Category"=> category, 
      "Mode"=>mode)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("play_motion", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end

## Voice related APIs


"""
    askNameCalledStatus(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `name_called_status`.

This method is equivalent to `askAction("name_called_status")`
"""
function askNameCalledStatus(;
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   askAction("name_called_status",
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askVoiceCommandStatus(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `voice_command_status`.

This method is equivalent to `askAction("voice_command_status")`
"""
function askVoiceCommandStatus(;
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   askAction("voice_command_status",
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end

## Person related APIs


"""
    askApproachPerson(
      distanceFromTarget=1;
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `approach_person`.

- `distanceFromTarget` : 0.4 -- 2 (meter)

This method is equivalent to `askAction("approach_person", Dict(DistanceFromTarget=>distanceFromTarget, Enqueue=>enqueue))`

"""
function askApproachPerson(
   distanceFromTarget=1;
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   arguments = Dict("DistanceFromTarget"=> distanceFromTarget)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("approach_person", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askChasePerson(
      chasingDurationMsec=15*1000;
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `chase_person`.

- `chasingDurationMsec` : 0 -- 360000 (milliseconds)

This method is equivalent to `askAction("chase_person", Dict(ChasingDurationMsec=>chasingDurationMsec, Enqueue=>enqueue))`

"""
function askChasePerson(
   chasingDurationMsec=15*1000;
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   arguments = Dict("ChasingDurationMsec"=> chasingDurationMsec)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("chase_person", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askFindPerson(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `find_person`.

This method is equivalent to `askAction("find_person")`
"""
function askFindPerson(;
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   askAction("find_person",
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


### Position related APIs

"""
    askExplore(
      duration=60;
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `explore`.

- `duration` : 0 -- 360 (seconds)

This method is equivalent to `askAction("explore", Dict(Duration=>duration, Enqueue=>enqueue))`

"""
function askExplore(
   duration=60;
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict("Duration"=> duration)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("explore", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askMoveToPosition(
      targetType="charging_station";
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `move_to_position`.

- `targetType` : one of the following constants:
  - `charging_station`
  - `greeting_spot`
  - `toilet`

This method is equivalent to `askAction("move_to_position", Dict(TargetType=>targetType, Enqueue=>enqueue))`
"""
function askMoveToPosition(
   targetType="charging_station";
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict("TargetType"=> targetType)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("move_to_position", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


### Moving related APIs

"""
    askTurnAround(;
      turnAngle=0,
      turnSpeed=1,
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `turn_around`.

- `turnSpeed` : one of 0 (slow), 1, 2 (fast)
- `turnAngle` : -180 -- 180, counterclockwise with respect to the current aibo angle.

This method is equivalent to `askAction("turn_around", Dict(TurnSpeed=> turnSpeed, TurnAngle=> turnAngle, Enqueue=>enqueue))`
"""
function askTurnAround(;
   turnAngle=0,
   turnSpeed=1,
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict(
      "TurnSpeed"=> turnSpeed, 
      "TurnAngle"=> turnAngle)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("turn_around", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askMoveAlongCircle(;
      movingAngle=360,
      radius=1,
      walkSpeed=1,
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `move_along_circle`.

- `walkSpeed`   : one of 0 (slow), 1, 2 (fast)
- `radius`      : 0.5 -- 3 (meter)
- `movingAngle` : 0 -- 1080 (degree)

This method is equivalent to `askAction("move_along_circle", Dict(WalkSpeed=> walkSpeed, Radius=> radius, MovingAngle=>movingAngle, Enqueue=>enqueue))`

"""
function askMoveAlongCircle(;
   movingAngle=360,
   radius=1,
   walkSpeed=1,
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict(
      "WalkSpeed"=> walkSpeed, 
      "Radius"=> radius, 
      "MovingAngle"=> movingAngle)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("move_along_circle", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askMoveDirection(;
      targetAngle=0,
      targetDistance=1,
      walkSpeed=1,
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `move_direction`.

- `walkSpeed`      : one of 0 (slow), 1, 2 (fast)
- `targetDistance` : 0 -- 6 (meter)
- `targetAngle`    : -180 -- 180, counterclockwise with respect to the current aibo angle.

This method is equivalent to `askAction("move_direction", Dict(WalkSpeed=> walkSpeed, TargetDistance=> targetDistance, TargetAngle=> targetAngle, Enqueue=>enqueue))`
"""
function askMoveDirection(;
   targetAngle=0,
   targetDistance=1,
   walkSpeed=1,
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict(
      "WalkSpeed"=> walkSpeed, 
      "TargetDistance"=> targetDistance,
      "TargetAngle"=> targetAngle)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("move_direction", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askMoveForward(;
      walkDistance=1,
      walkSpeed=1,
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `move_forward`.

- `walkSpeed`    : one of 0 (slow), 1, 2 (fast)
- `walkDistance` : -6 -- 6 (meter)

This method is equivalent to `askAction("move_forward", Dict(WalkSpeed=> walkSpeed, WalkDistance=> walkDistance, Enqueue=>enqueue))`
"""
function askMoveForward(;
   walkDistance=1,
   walkSpeed=1,
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict(
      "WalkSpeed"=> walkSpeed,
      "WalkDistance"=> walkDistance)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("move_forward", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askMoveSideways(;
      walkDistance=0.5,
      walkSpeed=1,
      enqueue=false,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `move_sideways`.

- `walkSpeed`    : one of 0 (slow), 1, 2 (fast)
- `walkDistance` : -6 -- 6 (meter)

This method is equivalent to `askAction("move_sideways", Dict(WalkSpeed=> walkSpeed, WalkDistance=> walkDistance, Enqueue=>enqueue))`
"""
function askMoveSideways(;
   walkDistance=0.5,
   walkSpeed=1,
   enqueue=false,
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict(
      "WalkSpeed"=> walkSpeed,
      "WalkDistance"=> walkDistance)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("move_sideways", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


### Object related APIs


"""
    askFoundObjectsStatus(;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `found_objects_status`.

This method is equivalent to `askAction("found_objects_status")`
"""
function askFoundObjectsStatus(;
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   askAction("found_objects_status",
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askApproachObject(
      targetType="pinkball",
      enqueue=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `approach_object`.

- `targetType` : one of the following constants:
  - `aibo`
  - `aibone`
  - `dice`
  - `pinkball`

This method is equivalent to `askAction("approach_object", Dict(TargetType=>targetType, Enqueue=>enqueue))`
"""
function askApproachObject(
   targetType="pinkball",
   enqueue=false;
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict("TargetType"=> targetType)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("approach_object", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askChaseObject(
      targetType="pinkball",
      chasingDurationMsec=30*1000,
      enqueue=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `chase_object`.

- `targetType` : one of the following constants:
  - `aibo`
  - `aibone`
  - `dice`
  - `pinkball`
- `chasingDurationMsec` : 0 -- 360000 (milliseconds)

This method is equivalent to `askAction("chase_object", Dict(TargetType=>targetType, ChasingDurationMsec=> chasingDurationMsec, Enqueue=>enqueue))`
"""
function askChaseObject(
   targetType="pinkball",
   chasingDurationMsec=30*1000,
   enqueue=false;
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict(
      "TargetType"=> targetType,
      "ChasingDurationMsec"=> chasingDurationMsec)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("chase_object", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askFindObject(
      targetType="pinkball",
      enqueue=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `find_object`.

- `targetType` : one of the following constants:
  - `aibo`
  - `aibone`
  - `dice`
  - `pinkball`

This method is equivalent to `askAction("find_object", Dict(TargetType=>targetType, Enqueue=>enqueue))`
"""
function askFindObject(
   targetType="pinkball",
   enqueue=false;
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict("TargetType"=> targetType)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("find_object", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askGetCloseToObject(
      targetType="pinkball",
      distance=0.2,
      enqueue=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `get_close_to_object`.
Invoke this method after `askApproachObject`.

- `targetType` : one of the following constants:
  - `aibo`
  - `aibone`
  - `dice`
  - `pinkball`

- `distance` : 0.1 -- 0.3 (meter)

This method is equivalent to `askAction("get_close_to_object", Dict(TargetType=>targetType, Distance=>distance, Enqueue=>enqueue))`
"""
function askGetCloseToObject(
   targetType="pinkball",
   distance=0.2,
   enqueue=false;
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict(
      "TargetType"=> targetType,
      "Distance"=> distance)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("get_close_to_object", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askKickObject(
      targetType="pinkball",
      kickMotion="kick",
      enqueue=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `kick_object`.

- `targetType` : one of the following constants:
  - `pinkball`

- `kickMotion` : one of the following constants:
  - `kick`
  - `heading`

This method is equivalent to `askAction("kick_object", Dict(TargetType=>targetType, KickMotion=>kickMotion, Enqueue=>enqueue))`
"""
function askKickObject(
   targetType="pinkball",
   kickMotion="kick",
   enqueue=false;
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict(
      "TargetType"=> targetType,
      "KickMotion"=> kickMotion)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("kick_object", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end


"""
    askReleaseObject(
      targetType="aibone",
      enqueue=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `release_object`.

- `targetType` : one of the following constants:
  - `aibone`
  - `dice`

This method is equivalent to `askAction("release_object", Dict(TargetType=>targetType, Enqueue=>enqueue))`
"""
function askReleaseObject(
   targetType="aibone",
   enqueue=false;
   target_deviceID=nothing,
   target_nickname=nothing,
	timeoutLimit=10)
   arguments = Dict("TargetType"=> targetType)
   if enqueue
      arguments["Enqueue"]=enqueue
   end
   askAction("release_object", arguments, 
      target_deviceID=target_deviceID, target_nickname=target_deviceID, timeoutLimit=timeoutLimit)
end