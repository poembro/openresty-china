(function (L) {
    var _this = null;
    L.Common = L.Common || {};
    _this = L.Common = {
        data: {},
 
        init: function () {

            emojify.setConfig({
                img_dir: '/static/libs/emojify/images/basic',  // Directory for emoji images
            });

            _this.md = markdownit({
                html:        true,        // 在源码中启用 HTML 标签
                xhtmlOut:     false,        // 使用 '/' 来闭合单标签 （比如 <br />）。
                                            // 这个选项只对完全的 CommonMark 模式兼容。
                breaks:       false,        // 转换段落里的 '\n' 到 <br>。
                langPrefix:   'language-',  // 给围栏代码块的 CSS 语言前缀。对于额外的高亮代码非常有用。
                linkify:      false,        // 将类似 URL 的文本自动转换为链接。
              
                // 启用一些语言中立的替换 + 引号美化
                typographer:  false,
              
                // 双 + 单引号替换对，当 typographer 启用时。
                // 或者智能引号等，可以是 String 或 Array。
                //
                // 比方说，你可以支持 '«»„“' 给俄罗斯人使用， '„“‚‘'  给德国人使用。
                // 还有 ['«\xA0', '\xA0»', '‹\xA0', '\xA0›'] 给法国人使用（包括 nbsp）。
                quotes: '“”‘’',
              
                // 高亮函数，会返回转义的HTML。
                // 或 '' 如果源字符串未更改，则应在外部进行转义。
                // 如果结果以 <pre ... 开头，内部包装器则会跳过。
                highlight: function (str, lang) {
                    if (lang && hljs.getLanguage(lang)) {
                        try {
                            return hljs.highlight(lang, str).value;
                        } catch (e) {}
                    }

                    return hljs.highlightAuto(str).value;; // use external default escaping
                }
            });
        },

        findUnreadMsg: function(){
            var maxRetryTimes = 5;

            var queryIntervar = setInterval(function(){
                query();
            }, 120000);

            function query(){
                $.ajax({
                    url : '/notification/unread_count',
                    type : 'get',
                    cache: false,
                    data: {},
                    dataType : 'json',
                    success : function(result) {
                        if(result.success){
                            var unread_count = result.data.count || 0;
                            if(unread_count>0){
                                $("#notification-area a").addClass("red-color");
                                $("#notification-area .count").text(unread_count).show();
                            }else{
                                $("#notification-area a").removeClass("red-color");
                                $("#notification-area .count").text(0).hide();
                            }
                        }else{
                            maxRetryTimes = maxRetryTimes-1;
                            if(maxRetryTimes <= 0){
                                clearInterval(queryIntervar);
                            }
                        }
                    },
                    error : function() {
                        maxRetryTimes = maxRetryTimes-1;
                        if(maxRetryTimes <= 0){
                            clearInterval(queryIntervar);
                        }
                    }
                });
            }

            query();
        },

        showTipDialog: function (title, content) {
            if (!content) {
                content = title;
                title = "Tips";
            }
            var d = dialog({
                title: title || 'Tips',
                content: content,
                width: 350,
                cancel: false,
                ok: function () {
                }
            });
            d.show();
        },
        
        resetNav: function(select){
            $("#main-nav-menu li").each(function(){
                $(this).removeClass("active")
            });

            if(select){
                $("#main-nav-menu li#"+select).addClass("active");
            }
        },
 
        formatDate: function (now) {
            var year = now.getFullYear();
            var month = now.getMonth() + 1;
            var date = now.getDate();
            var hour = now.getHours();
            var minute = now.getMinutes();
            var second = now.getSeconds();
            if (second < 10) second = "0" + second;
            return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second;
        }
    };
}(APP));