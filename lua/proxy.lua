local   http = require("resty.http")
-- local cjson = require("cjson")
local httpc = http.new()

local res, err = httpc:request_uri("http://www.baidu.com")

if not res then
    ngx.say("no data return\n" .. err)
elseif res.status == ngx.HTTP_OK then
    -- ngx.log(ngx.ERR, cjson.encode(res.body))
    ngx.say(res.body)
else
    ngx.exit(res.status)
end