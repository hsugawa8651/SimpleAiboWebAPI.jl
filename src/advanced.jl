
# Advanced APIs

export 
   askHungryStatus, askSleepyStatus,
   askPawPadsStatus,
   askBodyTouchedStatus,
   askPostureStatus, askChangePosture, askMoveHead, askStay,
   askBitingStatus, askPlayBone, askPlayDice, askPlayMotion,
   askNameCalledStatus, askVoiceCommandStatus,
   askApproachPerson, askChasePerson, askFindPerson,
   askExplore, askMoveToPosition,
   askTurnAround, askMoveAlongCircle, askMoveDirection,
   askMoveForward, askMoveSideways,
   askFoundObjectsStatus

## Status related APIs

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
      finalPosture,
      enquee=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `change_posture`.

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


"""
    askMoveHead(
      azimuth,
      elevation,
      velocity,
      enquee=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `move_head`.

- `azimuth` : -80 -- 80 (degree)
- `elevation` : -40 -- 40 (degree)
- `velocity` : 10 -- 80 (deg/sec)

This method is equivalent to `askAction("move_head", Dict(Duration=>duration, Enqueue=>enqueue))`

"""
function askMoveHead(
   azimuth,
   elevation,
   velocity,
   enqueue=false;
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
    askStay(
      duration,
      enquee=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `stay` for `duration` seconds.

- `duration` : 0--360 (seconds)

This method is equivalent to `askAction("stay", Dict(Duration=>duration, Enqueue=>enqueue))`

"""
function askStay(
   duration=60,
   enqueue=false;
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
      enquee=false;
      category="holdMouth",
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `play_bone`.


This method is equivalent to `askAction("play_bone", Dict(Category=>holdMouth, Enqueue=>enqueue))`

"""
function askPlayBone(
   enqueue=false;
   category="holdMouth",
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
      category="holdMouthDice",
      enquee=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `change_posture`.

- `category` should be one of the following string:
  - `holdMouthDice`
  - `rollDiceLeft`
  - `rollDiceRight`
  - `rollDicePush`
  - `rollDicePull`
  - `stackDice`

This method is equivalent to `askAction("play_dice", Dict(Category=>category, Enqueue=>enqueue))`

"""
function askPlayDice(
   category="holdMouthDice",
   enqueue=false;
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
      category="agree",
      enquee=false;
      Mode="NONE",
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `play_motion`.

- `category` should be one of the following string. Optional `Mode` parameters other than "NONE" is also listed.
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
   category="agree",
   enqueue=false;
   Mode="NONE",
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
      distanceFromTarget=1,
      enquee=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `approach_person`.

- `distanceFromTarget` : 0.4 -- 2 (meter)

This method is equivalent to `askAction("approach_person", Dict(DistanceFromTarget=>distanceFromTarget, Enqueue=>enqueue))`

"""
function askApproachPerson(
   distanceFromTarget=1,
   enqueue=false;
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
      chasingDurationMsec=15*1000,
      enquee=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `chase_person`.

- `chasingDurationMsec` : 0 -- 360000 (milliseconds)

This method is equivalent to `askAction("chase_person", Dict(ChasingDurationMsec=>chasingDurationMsec, Enqueue=>enqueue))`

"""
function askChasePerson(
   chasingDurationMsec=15*1000,
   enqueue=false;
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
      duration=60,
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `explore`.

- `duration` : 0 -- 360 (seconds)

This method is equivalent to `askAction("explore", Dict(Duration=>duration, Enqueue=>enqueue))`

"""
function askExplore(
   duration=60,
   enqueue=false;
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
      targetType,
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
   targetType,
   enqueue=false;
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
    askTurnAround(
      turnSpeed=1,
      turnAngle=0,
      enqueue=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `turn_around`.

- `turnSpeed` : one of 0 (slow), 1, 2 (fast)
- `turnAngle` : -180 -- 180, counterclockwise with respect to the current aibo angle.

This method is equivalent to `askAction("turn_around", Dict(TurnSpeed=> turnSpeed, TurnAngle=> turnAngle, Enqueue=>enqueue))`
"""
function askTurnAround(
   turnSpeed=1,
   turnAngle=0,
   enqueue=false;
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
    askMoveAlongCircle(
      walkSpeed=1,
      radius=1,
      movingAngle=360,
      enqueue=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `move_along_circle`.

- `walkSpeed`   : one of 0 (slow), 1, 2 (fast)
- `radius`      : 0.5 -- 3 (meter)
- `movingAngle` : 0 -- 1080 (degree)

This method is equivalent to `askAction("move_along_circle", Dict(WalkSpeed=> walkSpeed, Radius=> radius, MovingAngle=>movingAngle, Enqueue=>enqueue))`

"""
function askMoveAlongCircle(
   walkSpeed=1,
   radius=1,
   movingAngle=360,
   enqueue=false;
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
    askMoveDirection(
      walkSpeed=1,
      targetDistance=1,
      targetAngle=0,
      enqueue=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `move_direction`.

- `walkSpeed`      : one of 0 (slow), 1, 2 (fast)
- `targetDistance` : 0 -- 6 (meter)
- `targetAngle`    : -180 -- 180, counterclockwise with respect to the current aibo angle.

This method is equivalent to `askAction("move_direction", Dict(WalkSpeed=> walkSpeed, TargetDistance=> targetDistance, TargetAngle=> targetAngle, Enqueue=>enqueue))`
"""
function askMoveDirection(
   walkSpeed=1,
   targetDistance=1,
   targetAngle=0,
   enqueue=false;
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
    askMoveForward(
      walkSpeed=1,
      walkDistance=1,
      enqueue=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `move_forward`.

- `walkSpeed`    : one of 0 (slow), 1, 2 (fast)
- `walkDistance` : -6 -- 6 (meter)

This method is equivalent to `askAction("move_forward", Dict(WalkSpeed=> walkSpeed, WalkDistance=> walkDistance, Enqueue=>enqueue))`
"""
function askMoveForward(
   walkSpeed=1,
   walkDistance=1,
   enqueue=false;
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
    askMoveSideways(
      walkSpeed=1,
      walkDistance=0.5,
      enqueue=false;
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks `move_sideways`.

- `walkSpeed`    : one of 0 (slow), 1, 2 (fast)
- `walkDistance` : -6 -- 6 (meter)

This method is equivalent to `askAction("move_sideways", Dict(WalkSpeed=> walkSpeed, WalkDistance=> walkDistance, Enqueue=>enqueue))`
"""
function askMoveSideways(
   walkSpeed=1,
   walkDistance=0.5,
   enqueue=false;
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