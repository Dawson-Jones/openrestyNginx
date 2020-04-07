--  完全是同步代码, 但是是非阻塞的, 不像 node.js 充满了各种回调...

local sock = ngx.socket.tcp()

local ok, err = sock:connect("www.baidu.com", 80)
if not ok then
    ngx.say("failed to connect", err)
    return
end

local req_data = "GET / HTTP/1.1\r\nHost: www.baidu.com\r\n\r\n"
local bytes, err = sock:send(req_data)
if err then
    ngx.say("failed to send", err)
    return
end

local data, err, partial = sock:receive()
if err then
    ngx.say("failed to receive", err)
    return
end

sock:close()
ngx.say("successfully talk to baidu\n", data)