local json = require('helper.Json')

local triggerCount = 0

local externalServer = {
    apiBaseUrl = 'http://192.168.100.12:3005'
}

local httpClient = HTTPClient.create()
httpClient:setTimeout(200000)

local httpClientRequest = HTTPClient.Request.create()

local function requestData()
    httpClientRequest:setURL(externalServer.apiBaseUrl .. '/get-dummy-data')
    httpClientRequest:setMethod('POST')

    local response = httpClient:execute(httpClientRequest)
    local success = HTTPClient.Response.getSuccess(response)

    print('success', success)

    if success then
        local responseContent = HTTPClient.Response.getContent(response)
        print('responseContent', json.encode(responseContent))
    end
end
Script.serveFunction('Engine_AsyncFunction.requestData', requestData)
local asyncHandle = Engine.AsyncFunction.create()
asyncHandle:setFunction('Engine_AsyncFunction.requestData')

local timer = Timer.create()
timer:setExpirationTime(1)
timer:setPeriodic(false)
timer:register("OnExpired", function()
    requestData()
end)

local function triggerGetData()
    triggerCount = triggerCount + 1
    print('trigger', triggerCount)

    timer:start()

    -- requestData() --- This call will block the thread until the task is finished
    -- asyncHandle:launch() --- This call will block the thread until the task is finished
end
Script.serveFunction('Engine_AsyncFunction.triggerGetData', triggerGetData)

local function main()
    print('APP STARTING...')
end
Script.register("Engine.OnStarted", main)

