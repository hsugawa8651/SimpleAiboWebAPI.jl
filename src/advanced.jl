
# Advanced APIs

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
   arguments = Dict("Category"=> category, "Mode"=>mode)
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

