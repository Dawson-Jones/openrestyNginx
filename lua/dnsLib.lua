local resolver = require("resty.dns.resolver")
local r, err = resolver:new{
    nameservers = {"8.8.8.8", {"8.8.4.4", 53} },
    retrans = 5, 
    timeout = 2000
}

if not r then
    ngx.say("failed to instantiate the resolver: ", err)
    return
end

local answers, err = r:query("www.qq.com")
if not answers then
    ngx.say("failed to quert the DNS server: ", err)
    return
end

if answers.errcode then
    ngx.say("server returned error code: ", answers.errcode, ": ", answers.errstr)
end

for i, ans in ipairs(answers) do
    ngx.say(ans.name, " ", ans.address or ans.cname, " type:", ans.type, " class:", ans.class, " ttl:", ans.ttl)
end