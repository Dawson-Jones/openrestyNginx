local encode = require("cjson").encode

local str = [[{"key":"value"}]]

function json_encode( str )
    local ok, t = pcall(encode, str)
    if not ok then
        return nil
    end
    return t
end

local res = json_encode(str)

if res then
    ngx.log(ngx.ERR, "success", res)
else
    ngx.log(ngx.ERR, "failed", res)
end

ngx.say("okokok...")