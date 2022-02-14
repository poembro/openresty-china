local sfind = string.find
local lor = require("lor.index")
local config = require("app.config.config")
local cookie_middleware =  require("lor.lib.middleware.cookie")  --cookie开启 
local reponse_time_middleware = require("app.middleware.response_time")  
local check_login_middleware = require("app.middleware.check_login")
local uploader_middleware = require("app.middleware.uploader")
local whitelist = config.whitelist
local view_config = config.view_config
local upload_config = config.upload_config

local app = lor()

app:conf("view enable", true)
app:conf("view engine", view_config.engine)
app:conf("view ext", view_config.ext)
app:conf("views", view_config.views)

-- app:use(reponse_time_middleware({
--     digits = 0,
--     header = 'X-Response-Time',
--     suffix = true
-- }))

--[[ 
    开启cookie 上传 验证 登陆
--]]
app:use(cookie_middleware());
app:use(uploader_middleware({
	dir = upload_config.dir
}))-- 文件上传开启
app:use(check_login_middleware(whitelist))-- 登陆页面验证 与 url 白名单
 


local common_router = require("app.routes.common")
local auth_router = require("app.routes.auth")
local topic_router = require("app.routes.topic")
local topics_router = require("app.routes.topics")
local comment_router = require("app.routes.comment")
local comments_router = require("app.routes.comments")
local user_router = require("app.routes.user")
local upload_router = require("app.routes.upload")
local category_router = require("app.routes.category")
local notification_router = require("app.routes.notification")
local error_router = require("app.routes.error")
 
app:use("/auth", auth_router())
app:use("/error", error_router())
app:use("/user", user_router())
app:use("/category", category_router())
app:use("/topic", topic_router())
app:use("/topics", topics_router())
app:use("/comment", comment_router())
app:use("/comments", comments_router())

app:use("/notification", notification_router())
app:use("/upload", upload_router())


app:get("/", common_router.index)
app:get("/index", common_router.index)
app:get("/share", common_router.share)
app:get("/ask", common_router.ask)
app:get("/settings", common_router.settings)
app:get("/about", common_router.about)


 
-- 错误处理中间件
app:erroruse(function(err, req, res, next)
    local hAccept = req.headers["Accept"]
    if req:is_found() ~= true and hAccept then
        if sfind(hAccept, "application/json") then
            res:status(404):json({
                success = false,
                msg = "404! sorry, not found."
            })
        else
            res:status(404):send("404! sorry, not found.")
        end
    end
    
    if hAccept and sfind(hAccept, "application/json") then
        res:status(500):json({
            success = false,
            msg = "500! unknown error65."
        })
    else
        ngx.log(ngx.ERR, err)
        res:status(500):send("unknown error44")
    end
end)

app:run()
