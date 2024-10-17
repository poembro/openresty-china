local DB = require("app.libs.db") 
local sensitive_words = require("resty.lua-sensitive-words.sensitive_words")

local _M = {}
function _M:new()
 --[[ 
    for line in io.lines("words.txt") do
        table.insert(words, line)
    end
]]
    local db = DB:new()
    local items, err = db:query("select word from t_words limit 5000") 
    if not items or err or type(items) ~= "table" or #items <= 0 then
       return {}
    end

    local words = {}
    for i,v in ipairs(items) do
        table.insert(words, v.word)
    end

    local obj = sensitive_words:new(words) 
    -- obj:dict_dump()

    local instance = {}
    instance.conn = obj
    setmetatable(instance, { __index = self})
    return instance
end


function _M:check(text)
    return self.conn:check(text) 
end 

return _M

