# Usage

- This package provides simple Web APIs to communicate with [Sony Aibo ERS-1000](https://electronics.sony.com/aibo/p/ers1000) in [Julia language](https://julialang.org/)
- Register [Aibo Developer program](https://us.aibo.com/developer/) to acquire your AccessToken to talk with Aibo ERS-1000
- Refer to [Documentation for Sony Aibo Web API](https://developer.aibo.com/us/docs)

Sample code:
```julia
using SimpleAiboWebAPI

yourAccessToken = ""  # your Access Token here
getDevices(yourAccessToken)  # Register your access token, and receive device list

# The default target device is the first device found in the device list.
askAction("hungry_status")
askHungryStatus()  # advanced API

# Change to DEVELOPMENT mode
askSetMode("DEVELOPMENT")  # advanced API

# Supply API arguments by Dict()
askAction("change_posture", Dict("FinalPosture" => "sit"))
askChangePosture("sit")  # advanced API

# Change to NORMAL mode
askSetMode("NORMAL")  # advanced API
askSetMode()  # advanced API

# Specify the target device by his/her nickname
askAction("hungry_status", target_nickname="aibo_nickname")
askHungryStatus(target_nickname="aibo_nickname")  # advanced API

# Set (change) the default device specified by his/her nickname
setDefaultDevice(target_nickname="aibo_nickname")
```

