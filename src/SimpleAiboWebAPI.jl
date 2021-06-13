
__precompile__(true)

# SimpleAiboWebAPI

module SimpleAiboWebAPI

# Basic APIs

include("basic.jl")

export 
   getDevices, getAccessToken, getCurrentDevices,
   getDefaultDevice, getDefaultDeviceId, getDefaultDeviceNickname,
   setDefaultDevice, findDevice,
   askActionSimple, askAction, getExecution

# Advanced APIs

include("advanced.jl")

export 
   askHungryStatus, askSleepyStatus,
   askPawPadsStatus,
   askBodyTouchedStatus,
   askPostureStatus, askChangePosture, askMoveHead, askStay,
   askBitingStatus, askPlayBone, askPlayDice, askPlayMotion,
   askNameCalledStatus, askVoiceCommandStatus,
   askApproachPerson, askChasePerson, askFindPerson

end
