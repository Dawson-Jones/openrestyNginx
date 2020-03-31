--[[
    luaide  模板位置位于 Template/FunTemplate/NewFileTemplate.lua 其中 Template 为配置路径 与luaide.luaTemplatesDir
    luaide.luaTemplatesDir 配置 https://www.showdoc.cc/web/#/luaide?page_id=713062580213505
    author:{author}
    time:2020-03-30 24:18:56
]]

local redis = require("resty.redis")
local red = redis.new()

red:set_timeout(1000)  -- 1 sec

local ok, err = red:connect("127.0.0.1", 6379)

if not ok then
    ngx.say("failed to connect: ", err)
    return
end

ok, err = red:set("dog", "an animal")
if not ok then
    ngx.say("failed to set dog:", err)
    return
end

ngx.say("set result: ", ok)

-- put it into the connectioin pool of size 100,
-- with 10 seconds max idle time

local ok, err = red:set_keepalive(10000, 100)
if not ok then
    ngx.say("failed to set keepalice: ", err)
    return
end
