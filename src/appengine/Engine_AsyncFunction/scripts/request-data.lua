local json = require('helper.Json')

local externalServer = {
    apiBaseUrl = 'http://192.168.101.163:3005'
}

local httpClient = HTTPClient.create()
httpClient:setTimeout(10000)

local httpClientRequest = HTTPClient.Request.create()
httpClientRequest:setURL(externalServer.apiBaseUrl .. '/get-dummy-data')
httpClientRequest:setMethod('POST')

local response = httpClient:execute(httpClientRequest)
local success = HTTPClient.Response.getSuccess(response)
local responseContent

if success then
    responseContent = HTTPClient.Response.getContent(response)
    print('responseContent', json.encode(responseContent))
end

return success, responseContent
