-- nginx.conf 中 lua_shared_dict my_cache 128m
-- 这个 cache 是 nginx 所有 worker 之间共享的

function get_from_cache( key )
    local cache_ngx = ngx.shared.mycache
    local value = cache_ngx:get(key)
    return value
end

function set_to_cache( key, value, exptime )
    if not exptime then
        exptime = 0
    end

    local cache_ngx = ngx.shared.mycache
    local succ, err, forcible = cache_ngx:set(key, value, exptime)
    return succ
end