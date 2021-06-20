var documenterSearchIndex = {"docs":
[{"location":"usage/#Usage","page":"Usage","title":"Usage","text":"","category":"section"},{"location":"usage/","page":"Usage","title":"Usage","text":"This package provides simple Web APIs to communicate with Sony Aibo ERS-1000 in Julia language\nRegister Aibo Developer program to acquire your AccessToken to talk with Aibo ERS-1000\nRefer to Documentation for Sony Aibo Web API","category":"page"},{"location":"usage/","page":"Usage","title":"Usage","text":"Sample code:","category":"page"},{"location":"usage/","page":"Usage","title":"Usage","text":"using SimpleAiboWebAPI\n\nyourAccessToken = \"\"  # your Access Token here\ngetDevices(yourAccessToken)  # Register your access token, and receive device list\n\n# The default target device is the first device found in the device list.\naskAction(\"hungry_status\")\naskHungryStatus()  # advanced API\n\n# Supply API arguments by Dict()\naskAction(\"change_posture\", Dict(\"FinalPosture\" => \"sit\"))\naskChangePosture(\"sit\")  # advanced API\n\n# Specify the target device by his/her nickname\naskAction(\"hungry_status\", target_nickname=\"aibo_nickname\")\naskHungryStatus(target_nickname=\"aibo_nickname\")  # advanced API\n\n# Set (change) the default device specified by his/her nickname\nsetDefaultDevice(target_nickname=\"aibo_nickname\")","category":"page"},{"location":"reference/","page":"Reference","title":"Reference","text":"List of APIs defined in SimpleAiboWebAPI.","category":"page"},{"location":"reference/#Setup-APIs","page":"Reference","title":"Setup APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"getDevices","category":"page"},{"location":"reference/#SimpleAiboWebAPI.getDevices","page":"Reference","title":"SimpleAiboWebAPI.getDevices","text":"getDevices(accessToken)\n\ntries to get device list associated to accessToken.\n\nIf successful, \n\nreturns device list of type Array{Dict}.\nassigns accessToken to currentAccessToken, the local variable.\nif non-empty device list is found, updates currentDevices and defaultDevice. Namely,\nassigns found device list to currentDevices, the local variable.\nassigns the first element of currentDevices to defaultDevice, the local variable, if currentDevices is not empty.\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"getAccessToken","category":"page"},{"location":"reference/#SimpleAiboWebAPI.getAccessToken","page":"Reference","title":"SimpleAiboWebAPI.getAccessToken","text":"getAccessToken()\n\nreturns the current access token, i.e., currentAccessToken, the local variable of this package.\n\n\n\n\n\n","category":"function"},{"location":"reference/#Basic-APIs","page":"Reference","title":"Basic APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"getCurrentDevices","category":"page"},{"location":"reference/#SimpleAiboWebAPI.getCurrentDevices","page":"Reference","title":"SimpleAiboWebAPI.getCurrentDevices","text":"getCurrentDevices()\n\nreturns the current device list, i.e., getCurrentDevices, the local variable of this package.\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"getDefaultDevice","category":"page"},{"location":"reference/#SimpleAiboWebAPI.getDefaultDevice","page":"Reference","title":"SimpleAiboWebAPI.getDefaultDevice","text":"getDefaultDevice()\n\nreturns the default device to which the WebAPI directs when target device is not specified in the call of askAction function.\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"getDefaultDeviceId","category":"page"},{"location":"reference/#SimpleAiboWebAPI.getDefaultDeviceId","page":"Reference","title":"SimpleAiboWebAPI.getDefaultDeviceId","text":"getDefaultDeviceId()\n\nreturns the deviceId of the default device.\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"getDefaultDeviceNickname","category":"page"},{"location":"reference/#SimpleAiboWebAPI.getDefaultDeviceNickname","page":"Reference","title":"SimpleAiboWebAPI.getDefaultDeviceNickname","text":"getDefaultDeviceNickname()\n\nreturns the nickname of the default device.\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"findDevice","category":"page"},{"location":"reference/#SimpleAiboWebAPI.findDevice","page":"Reference","title":"SimpleAiboWebAPI.findDevice","text":"findDevice(;deviceId=nothing, nickname=nothing)\n\nreturns a device whose deviceID and/or nickname key(s) match(es) the corresponding parameter(s).\n\nReturns the result of getDefaultDevice() if both parameters are omitted.\nReturns Dict() if such a device is absent. \n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"setDefaultDevice","category":"page"},{"location":"reference/#SimpleAiboWebAPI.setDefaultDevice","page":"Reference","title":"SimpleAiboWebAPI.setDefaultDevice","text":"setDefaultDeviceNickname(;target_deviceId=nothing, target_nickname=nothing)\n\nassigns the default device to the result of findDevice(deviceId=target_deviceId, nickname=target_nickname).\n\nThe default device remains unchanged if such a device is absent.\n\n\n\n\n\n","category":"function"},{"location":"reference/#Action-APIs","page":"Reference","title":"Action APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"askActionSimple","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askActionSimple","page":"Reference","title":"SimpleAiboWebAPI.askActionSimple","text":"askActionSimple(\n  api_name,\n  arguments,\n  target_deviceId,\n  timeoutLimit = 10)\n\nasks a device to perform an action, and returns the result by Dict().\n\napi_name and arguments specify the action and arguments.\ntarget_deviceId specifies the deviceId of the target device.\nIf timeoutLimit <= 0, immediately returns executionId.\nOtherwise, invokes getExecution(executionId, timeoutLimit).\ntimeoutLimit specifies the limit of timeouts in seconds, and defaults to 10 (seconds).\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askAction","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askAction","page":"Reference","title":"SimpleAiboWebAPI.askAction","text":"askAction(\n  api_name,\n  arguments = Dict(); \n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks a device to perform an action, and returns the result by Dict().\n\napi_name and arguments specify the action and arguments.\narguments is optional, defaults to Dict().\ntarget device to which the Web API directs are determined as follows using two optional keyword arguments, target_deviceId and target_nickname\nthe result of getDefaultDevice() if both parameters are omitted.\nthe result of findDevice(deviceId=target_deviceID, nickname=target_nickname) if either or both parameters are present.\nIf timeoutLimit <= 0, immediately returns executionId.\nOtherwise, invokes getExecution(executionId, timeoutLimit).\ntimeoutLimit specifies the limit of timeouts in seconds, and defauls to 10 (seconds).\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"getExecution","category":"page"},{"location":"reference/#SimpleAiboWebAPI.getExecution","page":"Reference","title":"SimpleAiboWebAPI.getExecution","text":"getExecution(\n  executionId, \n  timeoutLimit=10 )\n\nreceives the result of executionId.\n\ntimeoutLimit specifies the limit of timeouts in seconds, and defaults to 10 (seconds).\n\n\n\n\n\n","category":"function"},{"location":"reference/#Advanced-APIs","page":"Reference","title":"Advanced APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"All the advanced API contain \"api_name\" inside.\nAll the advanced API have following three optional keyword arguments, as askAction has.\ntarget_deviceID\ntarget_nickname\nAbove two arguments are hints to determine target device.\ntimeoutLimit","category":"page"},{"location":"reference/#Status-related-APIs","page":"Reference","title":"Status related APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"askHungryStatus","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askHungryStatus","page":"Reference","title":"SimpleAiboWebAPI.askHungryStatus","text":"askHungryStatus(;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks hungry_status.\n\nThis method is equivalent to askAction(\"hungry_status\")\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askSleepyStatus","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askSleepyStatus","page":"Reference","title":"SimpleAiboWebAPI.askSleepyStatus","text":"askSleepyStatus(;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks sleepy_status.\n\nThis method is equivalent to askAction(\"sleepy_status\")\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askBodyTouchedStatus","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askBodyTouchedStatus","page":"Reference","title":"SimpleAiboWebAPI.askBodyTouchedStatus","text":"askBodyTouchedStatus(;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks body_touched_status.\n\nThis method is equivalent to askAction(\"body_touched_status\")\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askPawPadsStatus","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askPawPadsStatus","page":"Reference","title":"SimpleAiboWebAPI.askPawPadsStatus","text":"askPawPadsStatus(;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks paw_pads_status.\n\nThis method is equivalent to askAction(\"paw_pads_status\")\n\n\n\n\n\n","category":"function"},{"location":"reference/#Posture-related-APIs","page":"Reference","title":"Posture related APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"askPostureStatus","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askPostureStatus","page":"Reference","title":"SimpleAiboWebAPI.askPostureStatus","text":"askPostureStatus(;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks posture_status.\n\nThis method is equivalent to askAction(\"posture_status\")\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askChangePosture","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askChangePosture","page":"Reference","title":"SimpleAiboWebAPI.askChangePosture","text":"askChangePosture(\n  finalPosture,\n  enquee=false;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks change_posture.\n\nfinalPosture should be one of the following string:\nback\ncrouch\ndown\ndown_and_lengthen_behind\ndown_and_shorten_behind\nsit_and_raise__both_hands\nsit\nsleep\nstand\nstand_straight\n\nThis method is equivalent to askAction(\"change_posture\", Dict(FinalPosture=>finalPosture, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askMoveHead","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askMoveHead","page":"Reference","title":"SimpleAiboWebAPI.askMoveHead","text":"askMoveHead(\n  azimuth,\n  elevation,\n  velocity,\n  enquee=false;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks move_head.\n\nazimuth : -80 – 80 (degree)\nelevation : -40 – 40 (degree)\nvelocity : 10 – 80 (deg/sec)\n\nThis method is equivalent to askAction(\"move_head\", Dict(Duration=>duration, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askStay","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askStay","page":"Reference","title":"SimpleAiboWebAPI.askStay","text":"askStay(\n  duration,\n  enquee=false;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks stay for duration seconds.\n\nduration : 0–360 (seconds)\n\nThis method is equivalent to askAction(\"stay\", Dict(Duration=>duration, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/#Play-related-APIs","page":"Reference","title":"Play related APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"askBitingStatus","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askBitingStatus","page":"Reference","title":"SimpleAiboWebAPI.askBitingStatus","text":"askBitingStatus(;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks biting_status.\n\nThis method is equivalent to askAction(\"biting_status\")\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askPlayBone","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askPlayBone","page":"Reference","title":"SimpleAiboWebAPI.askPlayBone","text":"askPlayBone(\n  enquee=false;\n  category=\"holdMouth\",\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks play_bone.\n\nThis method is equivalent to askAction(\"play_bone\", Dict(Category=>holdMouth, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askPlayDice","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askPlayDice","page":"Reference","title":"SimpleAiboWebAPI.askPlayDice","text":"askPlayDice(\n  category=\"holdMouthDice\",\n  enquee=false;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks change_posture.\n\ncategory should be one of the following string:\nholdMouthDice\nrollDiceLeft\nrollDiceRight\nrollDicePush\nrollDicePull\nstackDice\n\nThis method is equivalent to askAction(\"play_dice\", Dict(Category=>category, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askPlayMotion","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askPlayMotion","page":"Reference","title":"SimpleAiboWebAPI.askPlayMotion","text":"askPlayMotion(\n  category=\"agree\",\n  enquee=false;\n  Mode=\"NONE\",\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks play_motion.\n\ncategory should be one of the following string. Optional Mode parameters other than \"NONE\" is also listed.\nagree\nbad\nbark\nbeckon\nMode: BODY_LEFT\nMode: BODY_RIGHT\nbelch\nbentBack\nbreath\ncurious\ndance\ndrawInOnesChin\ndreaming\nfriendly\nfriendlyPolite\ngasp\nhalfAsleep\nhandsUp\nhappyOrHot\nheading\nMode: NONE\nMode: SPACE_LEFT\nMode: SPACE_RIGHT\nhelloIloveYou\nhighFive\nMode: NONE\nMode: BODY_LEFT\nMode: BODY_RIGHT\nimFriendly\njiggle\nkiss\nlickBody\nMode: BODY_LEFT\nMode: BODY_RIGHT\nlookAroundHead\nlookOver\nmarking\nMode: BOY\nMode: GIRL\nnodHead\nopenMouth\noverJoyed\npaw\nMode: BODY_LEFT\nMode: BODY_RIGHT\npeace\nMode: SPACE_LEFT\nMode: SPACE_RIGHT\nperceive\nplayBiting\nprettyPlease\nready\nrelax\nrestless\nrubBack\nscratchFloor\nscratchHead\nMode: HIND_LEFT\nMode: HIND_RIGHT\nshakeHead\nshakeHipsBehind\nshudder\nsideKick\nMode: FRONT_LEFT\nMode: FRONT_RIGHT\nsideUp\nMode: BODY_LEFT\nMode: BODY_RIGHT\nsing\nsleepTalking\nsneeze\nsniff\nsniffDown\nsniffUp\nstartled\nstartledLittle\nstretch\nswing\ntouched\nMode: SPACE_CENTER\nwaiting\nwashFace\nwhine\nwiggleEar\nMode : BODY_BOTH\nwoof\nyap\nyawn\n\nThis method is equivalent to askAction(\"play_motion\", Dict(Category=>category, Mode=>mode, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/#Voice-related-APIs","page":"Reference","title":"Voice related APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"askNameCalledStatus","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askNameCalledStatus","page":"Reference","title":"SimpleAiboWebAPI.askNameCalledStatus","text":"askNameCalledStatus(;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks name_called_status.\n\nThis method is equivalent to askAction(\"name_called_status\")\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askVoiceCommandStatus","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askVoiceCommandStatus","page":"Reference","title":"SimpleAiboWebAPI.askVoiceCommandStatus","text":"askVoiceCommandStatus(;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks voice_command_status.\n\nThis method is equivalent to askAction(\"voice_command_status\")\n\n\n\n\n\n","category":"function"},{"location":"reference/#Person-related-APIs","page":"Reference","title":"Person related APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"askApproachPerson","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askApproachPerson","page":"Reference","title":"SimpleAiboWebAPI.askApproachPerson","text":"askApproachPerson(\n  distanceFromTarget=1,\n  enquee=false;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks approach_person.\n\ndistanceFromTarget : 0.4 – 2 (meter)\n\nThis method is equivalent to askAction(\"approach_person\", Dict(DistanceFromTarget=>distanceFromTarget, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askChasePerson","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askChasePerson","page":"Reference","title":"SimpleAiboWebAPI.askChasePerson","text":"askChasePerson(\n  chasingDurationMsec=15*1000,\n  enquee=false;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks chase_person.\n\nchasingDurationMsec : 0 – 360000 (milliseconds)\n\nThis method is equivalent to askAction(\"chase_person\", Dict(ChasingDurationMsec=>chasingDurationMsec, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askFindPerson","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askFindPerson","page":"Reference","title":"SimpleAiboWebAPI.askFindPerson","text":"askFindPerson(;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks find_person.\n\nThis method is equivalent to askAction(\"find_person\")\n\n\n\n\n\n","category":"function"},{"location":"reference/#Position-related-APIs","page":"Reference","title":"Position related APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"askExplore","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askExplore","page":"Reference","title":"SimpleAiboWebAPI.askExplore","text":"askExplore(\n  duration=60,\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks explore.\n\nduration : 0 – 360 (seconds)\n\nThis method is equivalent to askAction(\"explore\", Dict(Duration=>duration, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askMoveToPosition","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askMoveToPosition","page":"Reference","title":"SimpleAiboWebAPI.askMoveToPosition","text":"askMoveToPosition(\n  targetType=\"charging_station\",\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks move_to_position.\n\ntargetType : one of the following constants:\ncharging_station\ngreeting_spot\ntoilet\n\nThis method is equivalent to askAction(\"move_to_position\", Dict(TargetType=>targetType, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/#Moving-related-APIs","page":"Reference","title":"Moving related APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"askTurnAround","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askTurnAround","page":"Reference","title":"SimpleAiboWebAPI.askTurnAround","text":"askTurnAround(\n  turnSpeed=1,\n  turnAngle=0,\n  enqueue=false;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks turn_around.\n\nturnSpeed : one of 0 (slow), 1, 2 (fast)\nturnAngle : -180 – 180, counterclockwise with respect to the current aibo angle.\n\nThis method is equivalent to askAction(\"turn_around\", Dict(TurnSpeed=> turnSpeed, TurnAngle=> turnAngle, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askMoveAlongCircle","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askMoveAlongCircle","page":"Reference","title":"SimpleAiboWebAPI.askMoveAlongCircle","text":"askMoveAlongCircle(\n  walkSpeed=1,\n  radius=1,\n  movingAngle=360,\n  enqueue=false;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks move_along_circle.\n\nwalkSpeed   : one of 0 (slow), 1, 2 (fast)\nradius      : 0.5 – 3 (meter)\nmovingAngle : 0 – 1080 (degree)\n\nThis method is equivalent to askAction(\"move_along_circle\", Dict(WalkSpeed=> walkSpeed, Radius=> radius, MovingAngle=>movingAngle, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askMoveDirection","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askMoveDirection","page":"Reference","title":"SimpleAiboWebAPI.askMoveDirection","text":"askMoveDirection(\n  walkSpeed=1,\n  targetDistance=1,\n  targetAngle=0,\n  enqueue=false;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks move_direction.\n\nwalkSpeed      : one of 0 (slow), 1, 2 (fast)\ntargetDistance : 0 – 6 (meter)\ntargetAngle    : -180 – 180, counterclockwise with respect to the current aibo angle.\n\nThis method is equivalent to askAction(\"move_direction\", Dict(WalkSpeed=> walkSpeed, TargetDistance=> targetDistance, TargetAngle=> targetAngle, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askMoveForward","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askMoveForward","page":"Reference","title":"SimpleAiboWebAPI.askMoveForward","text":"askMoveForward(\n  walkSpeed=1,\n  walkDistance=1,\n  enqueue=false;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks move_forward.\n\nwalkSpeed    : one of 0 (slow), 1, 2 (fast)\nwalkDistance : -6 – 6 (meter)\n\nThis method is equivalent to askAction(\"move_forward\", Dict(WalkSpeed=> walkSpeed, WalkDistance=> walkDistance, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askMoveSideways","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askMoveSideways","page":"Reference","title":"SimpleAiboWebAPI.askMoveSideways","text":"askMoveSideways(\n  walkSpeed=1,\n  walkDistance=0.5,\n  enqueue=false;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks move_sideways.\n\nwalkSpeed    : one of 0 (slow), 1, 2 (fast)\nwalkDistance : -6 – 6 (meter)\n\nThis method is equivalent to askAction(\"move_sideways\", Dict(WalkSpeed=> walkSpeed, WalkDistance=> walkDistance, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/#Object-related-APIs","page":"Reference","title":"Object related APIs","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"askFindObject","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askFindObject","page":"Reference","title":"SimpleAiboWebAPI.askFindObject","text":"askFindObject(\n  targetType=\"pinkball\",\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks find_object.\n\ntargetType : one of the following constants:\naibo\naibone\ndice\npinkball\n\nThis method is equivalent to askAction(\"find_object\", Dict(TargetType=>targetType, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askFoundObjectsStatus","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askFoundObjectsStatus","page":"Reference","title":"SimpleAiboWebAPI.askFoundObjectsStatus","text":"askFoundObjectsStatus(;\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks found_objects_status.\n\nThis method is equivalent to askAction(\"found_objects_status\")\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askChaseObject","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askChaseObject","page":"Reference","title":"SimpleAiboWebAPI.askChaseObject","text":"askChaseObject(\n  targetType=\"pinkball\",\n  chasingDurationMsec=30*1000,\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks chase_object.\n\ntargetType : one of the following constants:\naibo\naibone\ndice\npinkball\nchasingDurationMsec : 0 – 360000 (milliseconds)\n\nThis method is equivalent to askAction(\"chase_object\", Dict(TargetType=>targetType, ChasingDurationMsec=> chasingDurationMsec, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askApproachObject","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askApproachObject","page":"Reference","title":"SimpleAiboWebAPI.askApproachObject","text":"askApproachObject(\n  targetType=\"pinkball\",\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks approach_object.\n\ntargetType : one of the following constants:\naibo\naibone\ndice\npinkball\n\nThis method is equivalent to askAction(\"approach_object\", Dict(TargetType=>targetType, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askGetCloseToObject","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askGetCloseToObject","page":"Reference","title":"SimpleAiboWebAPI.askGetCloseToObject","text":"askGetCloseToObject(\n  targetType=\"pinkball\",\n  distance=0.2,\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks get_close_to_object. Invoke this method after askApproachObject.\n\ntargetType : one of the following constants:\naibo\naibone\ndice\npinkball\ndistance : 0.1 – 0.3 (meter)\n\nThis method is equivalent to askAction(\"get_close_to_object\", Dict(TargetType=>targetType, Distance=>distance, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askKickObject","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askKickObject","page":"Reference","title":"SimpleAiboWebAPI.askKickObject","text":"askKickObject(\n  targetType=\"pinkball\",\n  kickMotion=\"kick\",\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks kick_object.\n\ntargetType : one of the following constants:\npinkball\nkickMotion : one of the following constants:\nkick\nheading\n\nThis method is equivalent to askAction(\"kick_object\", Dict(TargetType=>targetType, KickMotion=>kickMotion, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/","page":"Reference","title":"Reference","text":"askReleaseObject","category":"page"},{"location":"reference/#SimpleAiboWebAPI.askReleaseObject","page":"Reference","title":"SimpleAiboWebAPI.askReleaseObject","text":"askReleaseObject(\n  targetType=\"aibone\",\n  target_deviceID=nothing,\n  target_nickname=nothing,\n  timeoutLimit=10)\n\nasks release_object.\n\ntargetType : one of the following constants:\naibone\ndice\n\nThis method is equivalent to askAction(\"release_object\", Dict(TargetType=>targetType, Enqueue=>enqueue))\n\n\n\n\n\n","category":"function"},{"location":"reference/#Alphabetical-Index","page":"Reference","title":"Alphabetical Index","text":"","category":"section"},{"location":"reference/","page":"Reference","title":"Reference","text":"","category":"page"},{"location":"usageja/#使い方","page":"使い方","title":"使い方","text":"","category":"section"},{"location":"usageja/","page":"使い方","title":"使い方","text":"Julia言語を用いて、aibo ERS-1000と対話するためのパッケージです\naibo Developer Siteに登録し、アクセストークンを取得してください\nSony Aibo Web API を読んでください.","category":"page"},{"location":"usageja/","page":"使い方","title":"使い方","text":"Sample code:","category":"page"},{"location":"usageja/","page":"使い方","title":"使い方","text":"using SimpleAiboWebAPI\n\nyourAccessToken = \"\"  # アクセストークン文字列\ngetDevices(yourAccessToken)  # アクセストークンを登録し、デバイスリストを取得します\n\n# 既定の通信先デバイスは、デバイスリストで最初に見つかったデバイスです\naskAction(\"hungry_status\")\naskHungryStatus()  # advanced API\n\n# API引数は Dict()で指定します\naskAction(\"change_posture\", Dict(\"FinalPosture\" => \"sit\"))\naskChangePosture(\"sit\")  # advanced API\n\n# aiboの名前で、通信先デバイスを指定できます\naskAction(\"hungry_status\", target_nickname=\"aibo_nickname\")\naskHungryStatus(target_nickname=\"aibo_nickname\")  # advanced API\n\n# aiboの名前で、既定の通信先デバイスを指定（変更）できます\nsetDefaultDevice(target_nickname=\"aibo_nickname\")","category":"page"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = SimpleAiboWebAPI","category":"page"},{"location":"#SimpleAiboWebAPI","page":"Home","title":"SimpleAiboWebAPI","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Simple Web API to communicate with Sony Aibo ERS-1000 in Julia language.","category":"page"},{"location":"","page":"Home","title":"Home","text":"<p align=\"center\">\nJulia meets Aibo !\n<br/>\n<img src=\"assets/JuliaMeetsAibo.png\" alt=\"\" title=\"Julia meets Aibo\" width=\"450\" />\n<br/>\nAibo meets Julia !\n\n</p>","category":"page"}]
}
