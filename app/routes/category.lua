local pairs = pairs
local ipairs = ipairs
local lor = require("lor.index")
local user_model = require("app.model.user")
local topic_model = require("app.model.topic")
local comment_model = require("app.model.comment")
local category_model = require("app.model.category")
local category_router = lor:Router()


category_router:get("/:category_id", function(req, res, next)
	local current_category = req.params.category_id

	if current_category == "1" then
		return res:redirect("/share")
	elseif current_category == "2" then
		return res:redirect("/ask")
	end

    return res:redirect("/index?category=" .. current_category or 0)
end)

category_router:get("/all", function(req, res, next)
    local dst = category_model:get_all()

	if dst then 
		res:json({
			success = true,
			data = dst
		})
	end
	return
end)

return category_router
