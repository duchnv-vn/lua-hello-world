local json = require('helper.Json')

local triggerCount = 0

local externalServer = {
    apiBaseUrl = 'http://192.168.101.163:3005'
}

local httpClient = HTTPClient.create()
httpClient:setTimeout(10000)

local httpClientRequest = HTTPClient.Request.create()

local function requestData_NUM()
    httpClientRequest:setURL(externalServer.apiBaseUrl .. '/get-dummy-data')
    httpClientRequest:setMethod('POST')

    local response = httpClient:execute(httpClientRequest)
    local success = HTTPClient.Response.getSuccess(response)

    if success then
        local responseContent = HTTPClient.Response.getContent(response)
        print('responseContent', json.encode(responseContent))
    end
end

local asyncHandle = Engine.AsyncFunction.create()

local function triggerGetData()
    triggerCount = triggerCount + 1

    -- requestData() --- This call will block the thread until the task is finished

    Script.serveFunction('Engine_AsyncFunction.requestData_' .. triggerCount, requestData_NUM)
    asyncHandle:setFunction('Engine_AsyncFunction.requestData_' .. triggerCount)
    asyncHandle:launch() --- This call will block the thread until the task is finished

    -- local success = Script.startScript("request-data", triggerCount)
    -- print('success', success)

    print('AFTER LAUNCHED...')
end
Script.serveFunction('Engine_AsyncFunction.triggerGetData', triggerGetData)

local function main()
    print('APP STARTING...')
end
Script.register("Engine.OnStarted", main)

