local smatch = string.match
local sfind = string.find

local dump = function (v)
    local __dump
	if not __dump then
		function __dump(v, t, p)    
			local k = p or "";

			if type(v) ~= "table" then
				table.insert(t, k .. " : " .. tostring(v));
			else
				for key, value in pairs(v) do
					__dump(value, t, k .. "[" .. key .. "]");
				end
			end
		end
	end

	local t = {'======== Lib:Dump Content ========'};
	__dump(v, t);
	print(table.concat(t, "\n"));
end


local jwt = require("app.libs.jwt")
local function is_login(toekn)   
	local user = jwt:decode(toekn) 
	if user and user.username and user.userid then
		return true, user
	end 
	
    return false, nil
end
 

local function check_login(whitelist)
	return function(req, res, next)
		local requestPath = req.path
	    local in_white_list = false
	    if requestPath == "/" then
	    	in_white_list = true
	    else
		    for i, v in ipairs(whitelist) do
		    	local match, err = smatch(requestPath, v)
		        if match then
		            in_white_list = true
		        end
		    end
		end

		local toekn = req.cookie.get("_TOKEN")
		local islogin, user = is_login(toekn) 
		if islogin then 
			res.locals.login = true
			res.locals.username = user.username
			res.locals.userid = user.userid
			res.locals.create_time = user.create_time 
		end

		if in_white_list then 
            next()
	    else
	        if islogin then
	            next()
	        else
	        	if sfind(req.headers["Accept"], "application/json") then
	        		res:json({
	        			success = false,
	        			msg = "该操作需要先登录."
	        		})
	        	else
	            	res:redirect("/auth/login")
	            end
	        end
		end
		
	end
end

return check_login

