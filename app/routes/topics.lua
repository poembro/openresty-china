local pairs = pairs
local ipairs = ipairs
local utils = require("app.libs.utils")
local page_config = require("app.config.config").page_config
local lor = require("lor.index")
local topic_model = require("app.model.topic")
local topics_router = lor:Router()


topics_router:get("/all", function(req, res, next)
    local page_no = req.query.page_no
    local topic_type = req.query.type
    local category = req.query.category or "0"
    local page_size = page_config.index_topic_page_size
    local search = req.query.search or "" 

    local total_count = topic_model:get_total_count(topic_type, category, search)
    local total_page = utils.total_page(total_count, page_size)
    local topics = topic_model:get_all(topic_type, category, search, page_no, page_size)
   
    -- 转义时间描述
    for k, v in pairs(topics) do 
        if v.create_time ~= "" then
            topics[k].create_time = utils.time_ago(v.create_time)
        end

        if v.last_reply_time ~= "" then
            topics[k].last_reply_time = utils.time_ago(v.last_reply_time)
        end 
    end

    res:json({
        success = true,
        data = {
            totalCount = total_count,
            totalPage = total_page,
            currentPage = page_no,
            topics = topics
        }
    })
end)


return topics_router
