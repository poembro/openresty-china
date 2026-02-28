local DB = require("app.libs.db")
local dict = require("app.libs.dict")

local db = DB:new()

local category_model = {}

 
function category_model:get_all222()
	local res, err = db:query("select id,name from category where is_delete = 0")
 
	if not res or err or type(res) ~= "table" or #res <= 0 then
   		return {}
   	else
   		return res
   	end
end

function category_model:get_all()
	-- 查询缓存或数据库中是否包含指定信息
	local cache_key = string.format("dict:category_get_all")
	local res, err = dict:get_or_load(cache_key, function()
		return db:query("select id,name from category where is_delete = 0")
	end, 300) -- 缓存300秒（5分钟），分类列表很少变化

	if not res or err or type(res) ~= "table" or #res <= 0 then
		return {}
	else
		return res
	end
end

return category_model