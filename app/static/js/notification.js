(function(L) {
    var _this = null;
    L.Notification = L.Notification || {};
    _this = L.Notification = {
        data: {},

        init: function() {
            _this.loadNotifications('all');
            _this.initEvents();
        },

        initEvents: function() {
            $('#unread-btn').click(function() {
                _this.loadNotifications('unread');
            });

            $('#mark-btn').click(function() {
                _this.markAllNotifications();
            });
        },

        deleteAllNotifications: function() {
            var d = dialog({
                title: '提示',
                content: '确定要删除所有通知吗?',
                okValue: '确定',
                ok: function() {
                    $.ajax({
                        url: '/notification/delete_all',
                        type: 'post',
                        data: {},
                        dataType: 'json',
                        success: function(result) {
                            if (result.success) {
                                $('#notifications-body').html('<div class="alert alert-info" role="alert">所有通知已被删除</div>');
                                $('#notification-area a').removeClass('red-color');
                                $('#notification-area .count').text(0).hide();
                                $('#pagebar').hide();
                            } else {
                                L.Common.showTipDialog('提示', result.msg || '删除全部通知发生错误');
                            }
                        },
                        error: function() {
                            L.Common.showTipDialog('提示', '删除全部通知请求发生异常');
                        }
                    });
                    return true;
                },
                cancelValue: '取消',
                cancel: function() {}
            });
            d.show();
        },

        markAllNotifications: function() {
            $.ajax({
                url: '/notification/mark',
                type: 'post',
                data: {},
                dataType: 'json',
                success: function(result) {
                    if (result.success) {
                        $('#notifications-body .notification').removeClass('not-mark');
                        $('#notification-area a').removeClass('red-color');
                        $('#notification-area .count').text(0).hide();
                    } else {
                        L.Common.showTipDialog('提示', result.msg || '标记全部通知为已读发生错误');
                    }
                },
                error: function() {
                    L.Common.showTipDialog('提示', '标记全部通知为已读请求发生异常');
                }
            });
        },

        loadNotifications: function(nType, pageNo) {
            pageNo = pageNo || 1;
            $.ajax({
                url: '/notification/all',
                type: 'get',
                cache: false,
                data: {
                    page_no: 1,
                    n_type: nType
                },
                dataType: 'json',
                success: function(result) {
                    $('#pagebar').hide();
                    if (result.success) {
                        if (!result.data || result.data.notifications.length <= 0) {
                            var typeText = nType === 'unread' ? '未读' : '';
                            $('#notifications-body').html('<div class="alert alert-info" role="alert">没有任何' + typeText + '通知</div>');
                        } else {
                            _this.page(result, 1, nType);
                        }
                    } else {
                        $('#notifications-body').html('<div class="alert alert-danger" role="alert">' + result.msg + '</div>');
                    }
                },
                error: function() {
                    $('#notifications-body').html('<div class="alert alert-danger" role="alert">查询通知请求发生错误。</div>');
                }
            });
        },

        page: function(result, pageNo, nType) {
            var data = result.data || {};
            var $container = $('#notifications-body');
            $container.empty();

            var tpl = $('#notification-item-tpl').html();
            var notifications = data.notifications || [];

            try {
                for (var i = 0; i < notifications.length; i++) {
                    try {
                        var commentContent = notifications[i].comment_content;
                        if (!commentContent) {
                            commentContent = '~~此评论已被删除~~';
                        }
                        notifications[i].comment_content = L.Common.md.render(commentContent);
                    } catch (e) {
                        console.log(e);
                    }
                }
                var html = juicer(tpl, data);
                $container.html(html);
                for (var i = 0; i < notifications.length; i++) {
                    emojify.run(document.getElementById('notification-' + notifications[i].id));
                }
            } catch (e) {
                console.log(e);
            }

            var currentPage = data.currentPage;
            var totalPage = data.totalPage;
            var totalCount = data.totalCount;

            if (totalPage > 1) {
                $('#pagebar').show();
                $.fn.jpagebar({
                    renderTo: $('#pagebar'),
                    totalpage: totalPage,
                    totalcount: totalCount,
                    pagebarCssName: 'pagination2',
                    currentPage: currentPage,
                    num_display_entries: 1,
                    num_edge_entries: 1,
                    onClickPage: function(pageNo) {
                        $.fn.setCurrentPage(this, pageNo);
                        $.ajax({
                            url: '/notification/all',
                            type: 'get',
                            cache: false,
                            data: {
                                page_no: pageNo,
                                n_type: nType
                            },
                            dataType: 'json',
                            success: function(result) {
                                var data = result.data || {};
                                var $container = $('#notifications-body');
                                $container.empty();

                                var tpl = $('#notification-item-tpl').html();
                                var notifications = data.notifications || [];

                                try {
                                    for (var i = 0; i < notifications.length; i++) {
                                        try {
                                            var commentContent = notifications[i].comment_content;
                                            if (!commentContent) {
                                                commentContent = '~~此评论已被删除~~';
                                            }
                                            notifications[i].comment_content = L.Common.md.render(commentContent);
                                        } catch (e) {
                                            console.log(e);
                                        }
                                    }
                                    var html = juicer(tpl, data);
                                    $container.html(html);
                                    for (var i = 0; i < notifications.length; i++) {
                                        emojify.run(document.getElementById('notification-' + notifications[i].id));
                                    }
                                } catch (e) {
                                    console.log(e);
                                }
                            },
                            error: function() {
                                $('#notifications-body').html('<div class="alert alert-danger" role="alert">查找通知请求发生错误。</div>');
                            }
                        });
                    }
                });
            } else {
                $('#pagebar').hide();
            }
        }
    };
}(APP));
