return {
	-- 白名单配置：不需要登录即可访问；除非要二次开发，否则不应更改
	whitelist = { 
		"^/index$",
		"^/ask$",
		"^/share$",
		"^/category/[0-9]+$",
		
		"^/topics/all$",
		"^/topic/[0-9]+/view$",
		"^/topic/[0-9]+/query$",

		"^/comments/all$",
		"^/users$", 
		"^/user/[0-9a-zA-Z-_]+/index$",
		"^/user/[0-9a-zA-z-_]+/topics$",
		"^/user/[0-9a-zA-z-_]+/collects$",
		"^/user/[0-9a-zA-z-_]+/comments$",
		"^/user/[0-9a-zA-z-_]+/follows$",
		"^/user/[0-9a-zA-z-_]+/fans$",
		"^/user/[0-9a-zA-z-_]+/hot_topics$",
		"^/user/[0-9a-zA-z-_]+/like_topics$",
		
		"^/auth/login$", -- login page
		"^/auth/sign_up$", -- sign up page
		"^/about$", -- about page
		"^/error/$" -- error page
	},

	-- 静态模板配置，保持默认不修改即可
	view_config = {
		engine = "tmpl",
		ext = "html",
		views = "/data/web/openresty-china/app/views/"
	},


	-- 分页时每页条数配置
	page_config = {
		index_topic_page_size = 15, -- 首页每页文章数
		topic_comment_page_size = 20, -- 文章详情页每页评论数
		notification_page_size = 15, -- 通知每页个数
	}, 
	-- ########################## 以下配置需要使用者自定义为本地需要的配置 ########################## --
 
	-- 用于存储密码的盐，请一定要修改此值, 一旦使用不能修改，用户也可自行实现其他密码方案
	pwd_secret = "salt_secret_for_password", 

	-- mysql配置
	mysql = {
		timeout = 5000,
		connect_config = {
			host = "127.0.0.1",
	        port = 13306,
	        database = "openresty_china",
	        user = "root",
	        password = "NOjyVFBqlCvhWM",
			max_packet_size = 1024 * 1024,
			charset = "utf8mb4"
		},
		pool_config = {
			max_idle_timeout = 20000, -- 20s
        	pool_size = 50 -- connection pool size
		}
	},

	
	-- 上传文件配置，如上传的头像、文章中的图片等
	upload_config = {
		dir = "/data/web/openresty-china/app/static/files", -- 文件目录，修改此值时须同时修改nginx配置文件中的$static_files_path值
	},	

}
