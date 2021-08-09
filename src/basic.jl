
# Basic APIs

export 
   getDevices, getAccessToken, getCurrentDevices,
   getDefaultDevice, getDefaultDeviceId, getDefaultDeviceNickname,
   setDefaultDevice, findDevice,
   askActionSimple, askAction, getExecution, isStatusSucceeded


using JSON
using HTTP
using DataStructures

global currentAccessToken=""
global currentDevices = []
global defaultDevice = Dict()

BASE_PATH = "https://public.api.aibo.com/v1"


"""
    getDevices(accessToken)

tries to get device list associated to `accessToken`.

If successful, 
* returns device list of type `Array{Dict}`.
* assigns `accessToken` to `currentAccessToken`, the local variable.
* if non-empty device list is found, updates `currentDevices` and `defaultDevice`. Namely,
* assigns found device list to `currentDevices`, the local variable.
* assigns the first element of `currentDevices` to `defaultDevice`, the local variable, if `currentDevices` is not empty.
"""
function getDevices(accessToken::String)
   get_url = join([ BASE_PATH, "devices" ], "/")
   req = HTTP.get(get_url, theHeaders(accessToken) )
   body = JSON.parse(String(req.body),
      dicttype=()->DefaultDict{String,Any}(Missing))
   if length(body) == 0
      return Dict()
   end
   global currentAccessToken = accessToken
   global currentDevices = body["devices"]
   if !isempty(currentDevices)
      global defaultDevice = first(currentDevices)
   end
   currentDevices
end


"""
    getAccessToken()

returns the current access token, i.e., `currentAccessToken`, the local variable of this package.
"""
function getAccessToken()
   global currentAccessToken
   currentAccessToken
end


"""
    getCurrentDevices()

returns the current device list, i.e., `getCurrentDevices`, the local variable of this package.
"""
function getCurrentDevices()
   global currentDevices
   currentDevices
end


"""
   getDefaultDevice()

returns the default device to which the WebAPI directs when target device is not specified in the call of `askAction` function.
"""
function getDefaultDevice()
   global defaultDevice
   defaultDevice
end


"""
    getDefaultDeviceId()

returns the deviceId of the default device.
"""
function getDefaultDeviceId()
   global defaultDevice
   defaultDevice["deviceId"]
end


"""
    getDefaultDeviceNickname()

returns the nickname of the default device.
"""
function getDefaultDeviceNickname()
   global defaultDevice
   defaultDevice["nickname"]
end


"""
    setDefaultDeviceNickname(;target_deviceId=nothing, target_nickname=nothing)

assigns the default device to the result of `findDevice(deviceId=target_deviceId, nickname=target_nickname)`.
- The default device remains unchanged if such a device is absent.
"""
function setDefaultDevice(;target_deviceId=nothing, target_nickname=nothing)
   device=findDevice(deviceId=target_deviceId, nickname=target_nickname)
   isempty(device) && return defaultDevice
   flag = all(k->(device[k]==defaultDevice[k]), ["deviceId","nickname"])
   if !flag
      global defaultDevice = device
   end
   return device
end


"""
    findDevice(;deviceId=nothing, nickname=nothing)

returns a device whose `deviceID` and/or `nickname` key(s) match(es) the corresponding parameter(s).
- Returns the result of `getDefaultDevice()` if both parameters are omitted.
- Returns `Dict()` if such a device is absent. 
"""
function findDevice(;deviceId=nothing, nickname=nothing)
   (isnothing(deviceId)&&isnothing(nickname))&& @goto fail
   global currentDevices
   isempty(currentDevices) && @goto fail
   if !isnothing(nickname)
      index=findfirst(x->x["nickname"]==nickname, currentDevices)
      isnothing(index) && @goto fail
      device=currentDevices[index]
      if !isnothing(deviceId)
         device["deviceId"]==deviceId || @goto fail
      end
      return device
   elseif !isnothing(deviceId)
      index=findfirst(x->x["deviceId"]==deviceId, currentDevices)
      isnothing(index) && @goto fail
      device=currentDevices[index]
      if !isnothing(nickname)
         device["nickname"]==nickname || @goto fail
      end
      return device
   end

   @label fail
      Dict()
end


function theHeaders(accessToken=currentAccessToken)
   Dict("Authorization" => "Bearer:" * accessToken )
end


"""
    askAction(
      api_name,
      arguments = Dict(); 
      target_deviceID=nothing,
      target_nickname=nothing,
      timeoutLimit=10)

asks a device to perform an action, and returns the result by `Dict()`.


- `api_name` and `arguments` specify the action and arguments.
  - `arguments` is optional, defaults to `Dict()`.
- target device to which the Web API directs are determined as follows using two optional keyword arguments, `target_deviceId` and `target_nickname`
  - the result of `getDefaultDevice()` if both parameters are omitted.
  - the result of `findDevice(deviceId=target_deviceID, nickname=target_nickname)` if either or both parameters are present.
- If `timeoutLimit` <= 0, immediately returns `executionId`.
- Otherwise, invokes `getExecution(executionId, timeoutLimit)`.
- `timeoutLimit` specifies the limit of timeouts in seconds, and defauls to 10 (seconds).

"""
function askAction(api_name, arguments = Dict(); 
   target_deviceID=nothing,
   target_nickname=nothing,
   timeoutLimit=10)
   device=getDefaultDevice()
   if !isnothing(target_deviceID) || !isnothing(target_nickname)
      device=findDevice(
         deviceId=target_deviceID, 
         nickname=target_nickname)
   end
   target_deviceId=device["deviceId"]
   askActionSimple(api_name, arguments, 
      target_deviceId, timeoutLimit=timeoutLimit)
end


"""
    askActionSimple(
      api_name,
      arguments,
      target_deviceId,
      timeoutLimit = 10)

asks a device to perform an action, and returns the result by `Dict()`.

- `api_name` and `arguments` specify the action and arguments.
- `target_deviceId` specifies the deviceId of the target device.

- If `timeoutLimit` <= 0, immediately returns `executionId`.
- Otherwise, invokes `getExecution(executionId, timeoutLimit)`.
- `timeoutLimit` specifies the limit of timeouts in seconds, and defaults to 10 (seconds).
"""
function askActionSimple(api_name, arguments, 
   target_deviceId;
   timeoutLimit=10)
   global currentAccessToken

   post_url = join([ BASE_PATH, 
      "devices", target_deviceId, "capabilities", 
      api_name, "execute" ], "/" )

   if !isempty(arguments)
      arguments = Dict("arguments" => arguments)
   end
   the_arguments = JSON.json(arguments) 
   req = HTTP.post(post_url, theHeaders(), body=the_arguments ) 
   post_result = JSON.parse(String(req.body),
      dicttype=()->DefaultDict{String,Any}(Missing))
   executionId = post_result["executionId"]
   if timeoutLimit <= 0
      return Dict( "executionId" => executionId)
   else
      return getExecution(executionId, timeoutLimit=timeoutLimit)
   end
end


"""
    getExecution(
      executionId; 
      timeoutLimit=10 )

receives the result of `executionId`.

- `timeoutLimit` specifies the limit of timeouts in seconds, and defaults to 10 (seconds).
"""
function getExecution(executionId; timeoutLimit=10)

   get_result_url = join( [BASE_PATH, "executions", executionId], "/" )

   for timeout in 0:timeoutLimit
      req = HTTP.get(get_result_url, theHeaders() )
      get_result = JSON.parse(String(req.body),
         dicttype=()->DefaultDict{String,Any}(Missing))
      get_status = get_result["status"]
      
      if     get_status == "SUCCEEDED"
         return get_result
      elseif get_status == "FAILED"
         return get_result
      else
         sleep(1)
      end
   end

   println("time out")
   return Dict()
end


"""
    isStatusSucceeded(result)

returns whether the status of the request `result` is "SUCCEEDED" or not.
"""
function isStatusSucceeded(result)
   isa(result, Dict) || return false
   haskey(result, "status") || return false
   result["status"] == "SUCCEEDED"
end
