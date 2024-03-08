local os = os
local type = type
local pairs = pairs
local type = type
local mceil = math.ceil
local mfloor = math.floor
local mrandom = math.random
local mmodf = math.modf
local stringformat = string.format
local sgsub = string.gsub
local tinsert = table.insert
local date = require("app.libs.date")
local resty_sha256 = require "resty.sha256"
local str = require "resty.string"
local ngx_quote_sql_str = ngx.quote_sql_str
local mail = require "resty.mail"

local _M = {}

function _M.encode(s)
    local sha256 = resty_sha256:new()
    sha256:update(s)
    local digest = sha256:final()
    return str.to_hex(digest)
end


function _M.clear_slash(s)
    s, _ = sgsub(s, "(/+)", "/")
    return s
end

function _M.is_table_empty(t)
    if t == nil or _G.next(t) == nil then
        return true
    else
        return false
    end
end

function _M.table_is_array(t)
    if type(t) ~= "table" then return false end
    local i = 0
    for _ in pairs(t) do
        i = i + 1
        if t[i] == nil then return false end
    end
    return true
end

function _M.mixin(a, b)
    if a and b then
        for k, v in pairs(b) do
            a[k] = b[k]
        end
    end
    return a
end

function _M.random()
    return mrandom(0, 1000)
end


function _M.total_page(total_count, page_size)
    local total_page = 0
    if total_count % page_size == 0 then
        total_page = total_count / page_size
    else
        local tmp, _ = mmodf(total_count/page_size)
        total_page = tmp + 1
    end

    return total_page
end


function _M.days_after_registry(create_time)
    local diff = 0
    local diff_days = 0 -- default value, days after registry

    if create_time then
        local now = date() -- seconds
        create_time = date(create_time)
        --ngx.log(ngx.ERR, "===>", now, " ====", create_time)
        diff = date.diff(now, create_time):spandays()
        diff_days = mfloor(diff)
    end 
    --ngx.log(ngx.ERR, "diff_days, diff==>  ", diff_days, "  ==  ", diff, "  -  ", create_time)
    return diff_days, diff
end

function _M.now()
    local n = date()
    local result = n:fmt("%Y-%m-%d %H:%M:%S")
    return result
end

function _M.secure_str(str)
    return ngx_quote_sql_str(str)
end


function _M.string_split(str, delimiter)
    if str==nil or str=='' or delimiter==nil then
        return nil
    end
    
    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        tinsert(result, match)
    end
    return result
end
 
function _M.time_ago(timestampStr)
    local timestamp = date(timestampStr)
    local now = date()
    local diff = date.diff(now, timestamp):spanseconds()
    -- 计算秒数
    local seconds = math.floor(diff) 
    -- 计算分钟数
    local minutes = math.floor(seconds / 60) 
    -- 计算小时数
    local hours = math.floor(minutes / 60) 
    -- 计算天数
    local days = math.floor(hours / 24) 
    -- 计算周数
    local weeks = math.floor(days / 7) 
    -- 计算月数
    local months = math.floor(days / 30.44) 
    -- 计算年数
    local years = math.floor(months / 12) 
    -- 返回结果
    if seconds < 30 then
      return "刚刚"
    elseif seconds < 60 then
      return stringformat("%d秒前", seconds)
    elseif minutes < 60 then
      return stringformat("%d分钟前", minutes)
    elseif hours < 24 then
      return stringformat("%d小时前", hours)
    elseif days < 7 then
      return stringformat("%d天前", days) 
    elseif weeks < 4 then
      return stringformat("%d周前", weeks)
    elseif months < 12 then
      return stringformat("%d个月前", months)
    else
      return stringformat("%d年前", years)
    end
end


--  utils.send_mail("fsdfds@qq.com")   

function _M.send_mail(account) 
    local mailer, err = mail.new({
        host = "smtp.gmail.com",
        port = 587,
        starttls = true,
        username = "xxxxxx@gmail.com",
        password = "uzvs hnjz",
        auth_type = "login"
    })
    if err then
        ngx.log(ngx.ERR, "mail.new error: ", err)
        return ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
    end
      
    local ok, err = mailer:send({
        from = "xxxxxx@gmail.com",
        to = { account },
        -- cc = { "leo@example.com", "Raphael <raph@example.com>", "donatello@example.com" },
        subject = "Pizza is here!",
        text = "There's pizza in the sewer.",
        -- html = "<h1>There's pizza in the sewer.</h1>",
        --[[ attachments = {
          {
            filename = "toppings.txt",
            content_type = "text/plain",
            content = "1. Cheese\n2. Pepperoni",
          },
        },
        ]]
    })
    if err then
        ngx.log(ngx.ERR, "mailer:send error: ", err)
        return ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
    end
end

return _M




-- local resty_sha256 = require "resty.sha256"
    -- local str = require "resty.string"
    -- local sha256 = resty_sha256:new()
    -- ngx.say(sha256:update("hello"))
    -- local digest = sha256:final()
    -- ngx.say("sha256: ", str.to_hex(digest))

    -- local resty_md5 = require "resty.md5"
    -- local md5 = resty_md5:new()
    -- if not md5 then
    --     ngx.say("failed to create md5 object")
    --     return
    -- end

    -- local ok = md5:update("hel")
    -- if not ok then
    --     ngx.say("failed to add data")
    --     return
    -- end

    -- ok = md5:update("lo")
    -- if not ok then
    --     ngx.say("failed to add data")
    --     return
    -- end

    -- local digest = md5:final()

    -- local str = require "resty.string"
    -- ngx.say("md5: ", str.to_hex(digest))
    --     -- yield "md5: 5d41402abc4b2a76b9719d911017c592"
