
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

## Advanced APIs

- All the advanced API contain "api_name" inside.
- All the advanced API have following three optional keyword arguments, as [`askAction`](@ref) has.
  - target_deviceID
  - target_nickname
    - Above two arguments are hints to determine target device.
  - timeoutLimit


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


```@docs
askPostureStatus
```

```@docs
askChangePosture
```


## Alphabetical Index

```@index
```
