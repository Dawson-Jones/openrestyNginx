local _M = {}

-- 对参数逐一校验, 有一个不是数字类型, false
function _M.is_number(...)
    local arg = {...}
    local num
    for _, v in ipairs(arg) do
        num = tonumber(v)
        if nil==num then
            return false
        end
    end
    return true
end

return _M