local DB = require("app.libs.db")
local db = DB:new()

local category_model = {}

 
function category_model:get_all()
	local res, err = db:query("select id,name from category where id > 0")
 
	if not res or err or type(res) ~= "table" or #res <= 0 then
   		return {}
   	else
   		return res
   	end
end

return category_model