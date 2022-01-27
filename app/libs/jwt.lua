local pwd_secret = "lua-resty-jwt"
local jwt = require "resty.jwt"

local _M = {} 


function _M:decode(jwt_token)
    if not jwt_token or jwt_token == "" then
        return false
    end

    local jwt_obj = jwt:verify(pwd_secret, jwt_token)  
    return jwt_obj.payload
end

function _M:encode(user_id, nickname, is_admin ,create_time) 
    local jwt_token = jwt:sign(
        pwd_secret,
        {
            header = {typ="JWT", alg="HS256"},
            payload = {userid = user_id, username = nickname, is_admin = is_admin, create_time = create_time or ""}
        }
    )
    return jwt_token
end

return _M
