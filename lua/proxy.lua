local http = require("resty.http")
local httpc = http.new()

local res, err = httpc:request_uri("http://www.baidu.com")

if not res then
    ngx.say("no data return\n" .. err)
elseif res.status == ngx.HTTP_OK then
    ngx.say(res.body)
else
    ngx.exit(res.status)
end