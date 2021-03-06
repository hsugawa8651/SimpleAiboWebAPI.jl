
List of APIs defined in [SimpleAiboWebAPI](https://github.com/hsugawa8651/SimpleAiboWebAPI.jl).


## Setup APIs
```@docs
getDevices
```

```@docs
getAccessToken
```

## Basic APIs

```@docs
getCurrentDevices
```

```@docs
getDefaultDevice
```

```@docs
getDefaultDeviceId
```

```@docs
getDefaultDeviceNickname
```

```@docs
findDevice
```

```@docs
setDefaultDevice
```

### Action APIs

```@docs
askActionSimple
```

```@docs
askAction
```

```@docs
getExecution
```

```@docs
isStatusSucceeded
```

## Advanced APIs

- All the advanced API contain "api_name" inside.
- All the advanced API have following three optional keyword arguments, as [`askAction`](@ref) has.
  - `target_deviceID`
  - `target_nickname`
    - Above two arguments are hints to determine target device.
  - `timeoutLimit`


### Status related APIs

```@docs
askSetMode
```

```@docs
askHungryStatus
```

```@docs
askSleepyStatus
```

```@docs
askBodyTouchedStatus
```

```@docs
askPawPadsStatus
```

### Posture related APIs

```@docs
askPostureStatus
```

```@docs
askChangePosture
```

```@docs
askMoveHead
```

```@docs
askStay
```

### Play related APIs

```@docs
askBitingStatus
```

```@docs
askPlayBone
```

```@docs
askPlayDice
```

```@docs
askPlayMotion
```


### Voice related APIs

```@docs
askNameCalledStatus
```

```@docs
askVoiceCommandStatus
```

### Person related APIs

```@docs
askApproachPerson
```

```@docs
askChasePerson
```

```@docs
askFindPerson
```

### Position related APIs

```@docs
askExplore
```

```@docs
askMoveToPosition
```

### Moving related APIs

```@docs
askTurnAround
```

```@docs
askMoveAlongCircle
```

```@docs
askMoveDirection
```

```@docs
askMoveForward
```

```@docs
askMoveSideways
```

### Object related APIs

```@docs
askFindObject
```

```@docs
askFoundObjectsStatus
```

```@docs
askChaseObject
```

```@docs
askApproachObject
```

```@docs
askGetCloseToObject
```

```@docs
askKickObject
```

```@docs
askReleaseObject
```

## Alphabetical Index

```@index
```
