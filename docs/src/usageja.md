# 使い方

- [Julia言語](https://julialang.org/)を用いて、[aibo ERS-1000](http://aibo.sony.jp/)と対話するためのパッケージです
- [aibo Developer Site](https://developer.aibo.com/jp/home)に登録し、アクセストークンを取得してください
- [Sony Aibo Web API](https://developer.aibo.com/jp/docs#introduction) を読んでください.

Sample code:
```julia
using SimpleAiboWebAPI

yourAccessToken = ""  # アクセストークン文字列
getDevices(yourAccessToken)  # アクセストークンを登録し、デバイスリストを取得します

# 既定の通信先デバイスは、デバイスリストで最初に見つかったデバイスです
askAction("hungry_status")
askHungryStatus()  # advanced API

# API引数は Dict()で指定します
askAction("change_posture", Dict("FinalPosture" => "sit"))
askChangePosture("sit")  # advanced API

# aiboの名前で、通信先デバイスを指定できます
askAction("hungry_status", target_nickname="aibo_nickname")
askHungryStatus(target_nickname="aibo_nickname")  # advanced API

# aiboの名前で、既定の通信先デバイスを指定（変更）できます
setDefaultDevice(target_nickname="aibo_nickname")
```
