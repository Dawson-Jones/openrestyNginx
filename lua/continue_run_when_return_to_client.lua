-- 与用户无关的数据统计等逻辑, 按照先返回在处理的原则
-- 伪代码

local response, user_stat = loginc_func.get_response(request)

ngx.say(response)
ngx.eof()

if user_stat then
    local ret = db_redis.update_user_data(user_stat)
end