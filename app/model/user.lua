local DB = require("app.libs.db")
local dict = require("app.libs.dict")

local db = DB:new()

local user_model = {}


function user_model:new(username, password, avatar)
    return db:query("insert into user(username, password, avatar) values(?,?,?)",
            {username, password, avatar})
end

-- 最新加入成员 列表
function user_model:querys()
    local res, err =  db:query("select * from user order by create_time DESC limit 50")
    if not res or err or type(res) ~= "table" or #res <= 0 then
		return {}
	else
		return res
	end
end

function user_model:query_ids(usernames)
   -- 使用参数化查询防止 SQL 注入
   if not usernames or type(usernames) ~= "table" or #usernames == 0 then
      return {}, nil
   end

   -- 构建占位符和参数
   local placeholders = {}
   local params = {}
   for i, username in ipairs(usernames) do
      table.insert(placeholders, "?")
      table.insert(params, username)
   end

   local sql = "select id from user where username in(" .. table.concat(placeholders, ",") .. ")"
   return db:query(sql, params)
end

function user_model:query(username, password)
   local res, err =  db:query("select * from user where username=? and password=?", {username, password})
   return res, err
end

function user_model:query_by_id(id)
    local result, err =  db:query("select * from user where id=?", {tonumber(id)})
    if not result or err or type(result) ~= "table" or #result ~=1 then
        return nil, err
    else
        return result[1], err
    end
end

-- return user, err
function user_model:query_by_username(username)
   	local res, err =  db:query("select * from user where username=? limit 1", {username})
   	if not res or err or type(res) ~= "table" or #res ~=1 then
		return nil, err or "error"
	end

	return res[1], err
end

function user_model:update_avatar(userid, avatar)
    db:query("update user set avatar=? where id=?", {avatar, userid})
end

function user_model:update_pwd(userid, pwd)
    local res, err = db:query("update user set password=? where id=?", {pwd, userid})
    if not res or err then
        return false
    else
        return true
    end

end

function user_model:update(userid, email, email_public, city, company, github, website, sign)
    local res, err = db:query("update user set email=?, email_public=?, city=?, company=?, github=?, website=?, sign=? where id=?", 
        { email, email_public, city, company, github, website, sign, userid})

    if not res or err then
        return false
    else
        return true
    end
end

function user_model:get_total_count222()
    local res, err = db:query("select count(id) as c from user")

    if err or not res or #res~=1 or not res[1].c then
        return 0
    else
        return res[1].c
    end
end


function user_model:get_total_count()
	-- 查询缓存或数据库中是否包含指定信息
	local cache_key = string.format("dict:user_get_all_count")
	local res, err = dict:get_or_load(cache_key, function()
		return db:query("select count(id) as c from user where is_delete=0")
	end, 120) -- 缓存120秒，用户总数统计

	if err or not res or #res~=1 or not res[1].c then
   		return 0
   	else
   		return res[1].c
   	end
end


return user_model
