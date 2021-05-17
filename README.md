# SimpleAiboWebAPI

Simple Web API to communicate with [Sony Aibo ERS-1000](https://electronics.sony.com/aibo/p/ers1000) by Julia language.

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://hsugawa8651.github.io/SimpleAiboWebAPI.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://hsugawa8651.github.io/SimpleAiboWebAPI.jl/dev)
[![Build Status](https://github.com/hsugawa8651/SimpleAiboWebAPI.jl/workflows/CI/badge.svg)](https://github.com/hsugawa8651/SimpleAiboWebAPI.jl/actions)
[![Build Status](https://ci.appveyor.com/api/projects/status/github/hsugawa8651/SimpleAiboWebAPI.jl?svg=true)](https://ci.appveyor.com/project/hsugawa8651/SimpleAiboWebAPI-jl)

## Usage

Register [Aibo Developer program](https://us.aibo.com/developer/)
to acquire your AccessToken to talk with Aibo ERS-1000. 

Refer to [the documentation for Sony Aibo Web API](https://developer.aibo.com/us/docs).

```julia
yourAccessToken = ""  # Consult https://us.aibo.com/developer/

using SimpleAiboWebAPI
getDeviceList(yourAccessToken)
askAction("hungry_status")
askAction("sleepy_status")
askAction("change_posture", Dict("FinalPosture" => "sit"))
```

## Disclaimer

- Only a few Sony Aibo Web APIs are implemented as advanced APIs in this package.
- Specifications of APIs in this package are subjected to change without notice.
