(function(L) {
    var _this = null;
    L.Common = L.Common || {};
    _this = L.Common = {
        data: {},

        init: function() {
            emojify.setConfig({
                img_dir: '/static/libs/emojify/images/basic'
            });

            _this.md = markdownit({
                html: true,
                xhtmlOut: false,
                breaks: false,
                langPrefix: 'language-',
                linkify: false,
                typographer: false,
                quotes: '" "'',
                highlight: function(str, lang) {
                    if (lang && hljs.getLanguage(lang)) {
                        try {
                            return hljs.highlight(lang, str).value;
                        } catch (e) {}
                    }
                    return hljs.highlightAuto(str).value;
                }
            });
        },

        findUnreadMsg: function() {
            var maxRetryTimes = 5;
            var queryInterval = null;

            function query() {
                $.ajax({
                    url: '/notification/unread_count',
                    type: 'get',
                    cache: false,
                    data: {},
                    dataType: 'json',
                    success: function(result) {
                        if (result.success) {
                            var unreadCount = result.data.count || 0;
                            var $notificationArea = $('#notification-area');
                            var $count = $notificationArea.find('.count');

                            if (unreadCount > 0) {
                                $notificationArea.find('a').addClass('red-color');
                                $count.text(unreadCount).show();
                            } else {
                                $notificationArea.find('a').removeClass('red-color');
                                $count.text(0).hide();
                            }
                        } else {
                            maxRetryTimes--;
                            if (maxRetryTimes <= 0) {
                                clearInterval(queryInterval);
                            }
                        }
                    },
                    error: function() {
                        maxRetryTimes--;
                        if (maxRetryTimes <= 0) {
                            clearInterval(queryInterval);
                        }
                    }
                });
            }

            query();
            queryInterval = setInterval(query, 120000);
        },

        showTipDialog: function(title, content) {
            if (!content) {
                content = title;
                title = 'Tips';
            }
            var d = dialog({
                title: title || 'Tips',
                content: content,
                width: 350,
                cancel: false,
                ok: function() {}
            });
            d.show();
        },

        resetNav: function(select) {
            $('#main-nav-menu li').removeClass('active');
            if (select) {
                $('#main-nav-menu li#' + select).addClass('active');
            }
        },

        formatDate: function(now) {
            var year = now.getFullYear();
            var month = now.getMonth() + 1;
            var date = now.getDate();
            var hour = now.getHours();
            var minute = now.getMinutes();
            var second = now.getSeconds();
            if (second < 10) second = '0' + second;
            return year + '-' + month + '-' + date + ' ' + hour + ':' + minute + ':' + second;
        }
    };
}(APP));
