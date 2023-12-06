local concat = table.concat 
local utils = require("app.libs.utils")
local DB = require("app.libs.db")
local db = DB:new()

local topic_model = {}

function topic_model:delete(user_id, topic_id)
	--[[ 
    local res, err = db:query("delete from topic where id=? ",
			{tonumber(topic_id)})
]]
    ngx.log(ngx.ERR, topic_id or 0, "帖子被用户", user_id or 0, "删除")
	local now = utils.now()
	local res, err = db:query("update topic set is_delete=? , update_time=? where id=? ", {1, now, tonumber(topic_id)})
    if res and not err then
    	return true
    else
    	return false
    end
end

function topic_model:new(title, content, user_id, user_name, category_id)
	local now = utils.now()
    return db:query("insert into topic(title, content, user_id, user_name, category_id, update_time,create_time) values(?,?,?,?,?,?,?)",
            {title, content, tonumber(user_id), user_name, tonumber(category_id), now, now})
end

function topic_model:update(topic_id, title, content, user_id, category_id)
	local now = utils.now()
    return db:query("update topic set title=?, content=?, category_id=?, update_time=? where id=? and user_id=?",
            {title, content,  tonumber(category_id), now, tonumber(topic_id), tonumber(user_id)})
end

-- 供管理员调用
function topic_model:update2(topic_id, title, content, user_id, category_id)
	local now = utils.now()
    return db:query("update topic set title=?, content=?, category_id=?, update_time=? where id=?",
            {title, content,  tonumber(category_id), now, tonumber(topic_id)})
end

function topic_model:get_my_topic(user_id, id)
    return db:query("select t.*, u.avatar as avatar, c.name as category_name from topic t "..
    	" left join user u on t.user_id=u.id " .. 
    	" left join category c on t.category_id=c.id " ..
    	" where t.id=? and t.is_delete=0 and t.user_id=? ", {tonumber(id),tonumber(user_id)})
end

-- 供管理员调用
function topic_model:get_my_topic2(id)
    return db:query("select t.*, u.avatar as avatar, c.name as category_name from topic t "..
    	" left join user u on t.user_id=u.id " .. 
    	" left join category c on t.category_id=c.id " ..
    	" where t.id=? and t.is_delete=0", {tonumber(id)})
end


function topic_model:get(id)
	db:query("update topic set view_num=view_num+1 where id=?", {tonumber(id)})
    return db:query("select t.*, u.avatar as avatar, c.name as category_name from topic t "..
    	" left join user u on t.user_id=u.id " .. 
    	" left join category c on t.category_id=c.id " ..
    	" where t.id=? and t.is_delete=0", {tonumber(id)})
end


function topic_model:get_all(topic_type, category, search, page_no, page_size)
	page_no = tonumber(page_no)
	page_size = tonumber(page_size)
 	if page_no < 1 then 
		page_no = 1
	end

	local where = {}
	local ops = {}
	local sqlwhere = ""
	local sqlorderby = ""
	
	if not topic_type or topic_type == "default" then -- 默认 
		sqlorderby = " order by t.weight desc, t.update_time desc "
	elseif topic_type == "recent-reply" then -- 最近回复
		sqlorderby = " order by t.weight desc, t.last_reply_time desc "
	elseif topic_type == "good" then -- 优质
		table.insert(where, "t.is_good=1")
		sqlorderby = " order by t.weight desc, t.id desc "
	elseif topic_type == "noreply" then -- 无人问津
		table.insert(where, "t.reply_num=0")
		sqlorderby = " order by t.weight desc, t.id desc"
	end

	category = tonumber(category) 
	if category ~= 0 then
		table.insert(where, "t.category_id=?")
		table.insert(ops, category)
	end
	
	if search and search ~= "" then
		table.insert(where, "t.title LIKE ? ")
		table.insert(ops, search .. "%")
	end

	table.insert(where, "t.is_delete=0")
	sqlwhere = concat(where, " AND ") 
	-- 追加分页
	table.insert(ops, (page_no - 1) * page_size)
	table.insert(ops, page_size)

	local res, err = db:query("select t.*, c.name as category_name, u.avatar as avatar from topic t " .. 
		" left join user u on t.user_id=u.id " ..
		" left join category c on t.category_id=c.id " ..
		" where " .. sqlwhere ..
		sqlorderby .. " limit ?,?", ops)
  
	if not res or err or type(res) ~= "table" or #res <= 0 then
		return {}
	else
		return res
	end
end


function topic_model:get_total_count(topic_type, category, search) 
	local where = {}
	local ops = {}

	if not topic_type or topic_type == "default" then -- 默认 
	elseif topic_type == "recent-reply" then -- 最近回复
	elseif topic_type == "good" then -- 优质
		table.insert(where, "is_good=1")
	elseif topic_type == "noreply" then -- 无人问津
		table.insert(where, "reply_num=0")
	end

	category = tonumber(category) 
	if category ~= 0 then
		table.insert(where, "category_id=?")
		table.insert(ops, category)
	end
	
	if search and search ~= "" then
		table.insert(where, "title LIKE ? ")
		table.insert(ops, search .. "%")
	end
	
	table.insert(where, "is_delete=0")
	local sqlwhere = concat(where, " AND ")
	local res, err = db:query("select count(id) as c from topic where " .. sqlwhere, ops)
 
	if err or not res or #res~=1 or not res[1].c then
   		return 0
   	else
   		return res[1].c
   	end
end

function topic_model:get_all_count()
	local res, err = db:query("select count(id) as c from topic where is_delete=0")

	if err or not res or #res~=1 or not res[1].c then
   		return 0
   	else
   		return res[1].c
   	end
end

function topic_model:get_all_of_user(user_id, page_no, page_size)
	page_no = tonumber(page_no)
	page_size = tonumber(page_size)
	if page_no < 1 then 
		page_no = 1
	end
	local res, err = db:query("select t.*, u.avatar as avatar, c.name as category_name  from topic t " .. 
		" left join user u on t.user_id=u.id " .. 
		" left join category c on t.category_id=c.id " ..
		" where t.user_id=? and t.is_delete=0 order by t.id desc limit ?,?",
		{tonumber(user_id), (page_no - 1) * page_size, page_size})

	if not res or err or type(res) ~= "table" or #res <= 0 then
		return {}
	else
		return res
	end
end

function topic_model:get_total_count_of_user(user_id)
	local res, err = db:query("select count(id) as c from topic where user_id=? and is_delete=0", {tonumber(user_id)})
	if err or not res or #res~=1 or not res[1].c then
   		return 0
   	else
   		return res[1].c
   	end
end



function topic_model:get_all_hot_of_user(user_id, page_no, page_size)
	page_no = tonumber(page_no)
	page_size = tonumber(page_size)
	if page_no < 1 then 
		page_no = 1
	end
	local res, err = db:query("select t.*, u.avatar as avatar, c.name as category_name  from topic t " .. 
		" left join user u on t.user_id=u.id " .. 
		" left join category c on t.category_id=c.id " ..
		" where t.user_id=? and t.is_delete=0 order by t.reply_num desc, like_num desc limit ?,?",
		{tonumber(user_id), (page_no - 1) * page_size, page_size})

	if not res or err or type(res) ~= "table" or #res <= 0 then
		return {}
	else
		return res
	end
end

function topic_model:get_total_hot_count_of_user(user_id)
	local res, err = db:query("select count(id) as c from topic where user_id=? and is_delete=0", {tonumber(user_id)})
	if err or not res or #res~=1 or not res[1].c then
   		return 0
   	else
   		return res[1].c
   	end
end


function topic_model:get_all_like_of_user(user_id, page_no, page_size)
	page_no = tonumber(page_no)
	page_size = tonumber(page_size)
	if page_no < 1 then 
		page_no = 1
	end
	local res, err = db:query("select t.*, u.avatar as avatar, c.name as category_name  from `like` l " .. 
		" right join topic t on t.id=l.topic_id " ..
		" left join user u on t.user_id=u.id " .. 
		" left join category c on t.category_id=c.id " ..
		" where l.user_id=? order by l.id desc limit ?,?",
		{tonumber(user_id), (page_no - 1) * page_size, page_size})

	if not res or err or type(res) ~= "table" or #res <= 0 then
		return {}
	else
		return res
	end
end

function topic_model:get_total_like_count_of_user(user_id)
	local res, err = db:query("select count(l.id) as c from `like` l " .. 
		" right join topic t on l.topic_id=t.id " .. 
		" where l.user_id=? and t.is_delete=0 ", {tonumber(user_id)})
	if err or not res or #res~=1 or not res[1].c then
   		return 0
   	else
   		return res[1].c
   	end
end


function topic_model:reset_last_reply(topic_id, user_id, user_name, last_reply_time) -- 更新最后回复人
	db:query("update topic set last_reply_id=?, last_reply_name=?, last_reply_time=? where id=?", 
		{tonumber(user_id), user_name, last_reply_time, tonumber(topic_id)})
end

return topic_model
