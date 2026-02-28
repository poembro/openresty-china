(function(L) {
    var _this = null;
    L.UserIndex = L.UserIndex || {};
    _this = L.UserIndex = {
        data: {
            username: '',
            load_topics: false,
            load_collects: false,
            load_comments: false,
            load_fans: false,
            load_follows: false,
            load_hot_topics: false,
            load_like_topics: false
        },

        init: function(username) {
            _this.data.username = username;
            _this.initEvents();
            $('#btn-show-hot-topics').click();
        },

        initEvents: function() {
            var username = _this.data.username;

            $('#btn-show-topics').click(function() {
                if (!_this.data.load_topics) {
                    _this.loadUserTopics(username, 1);
                    _this.data.load_topics = true;
                }
            });

            $('#btn-show-comments').click(function() {
                if (!_this.data.load_comments) {
                    _this.loadUserComments(username, 1);
                    _this.data.load_comments = true;
                }
            });

            $('#btn-show-collects').click(function() {
                if (!_this.data.load_collects) {
                    _this.loadUserCollects(username, 1);
                    _this.data.load_collects = true;
                }
            });

            $('#btn-show-follows').click(function() {
                if (!_this.data.load_follows) {
                    _this.loadUserFollows(username, 1);
                    _this.data.load_follows = true;
                }
            });

            $('#btn-show-fans').click(function() {
                if (!_this.data.load_fans) {
                    _this.loadUserFans(username, 1);
                    _this.data.load_fans = true;
                }
            });

            $('#btn-show-hot-topics').click(function() {
                if (!_this.data.load_hot_topics) {
                    _this.loadUserHotTopics(username, 1);
                    _this.data.load_hot_topics = true;
                }
            });

            $('#btn-show-like-topics').click(function() {
                if (!_this.data.load_like_topics) {
                    _this.loadUserLikeTopics(username, 1);
                    _this.data.load_like_topics = true;
                }
            });

            $('.sidebar-fans a').click(function() {
                $('#btn-show-fans').click();
            });

            $('.sidebar-follows a').click(function() {
                $('#btn-show-follows').click();
            });

            $('.sidebar-topics a').click(function() {
                $('#btn-show-topics').click();
            });

            _this.initDeleteTopic();
            _this.initDeleteComment();
            _this.initDeleteCollect();
            _this.initDeleteLike();
            _this.initRelationOp();
        },

        initDeleteTopic: function() {
            $(document).on('click', '.delete-topic', function() {
                var topicId = $(this).attr('data-id');
                var d = dialog({
                    title: '提示',
                    content: '确定要删除吗?',
                    okValue: '确定',
                    ok: function() {
                        $.ajax({
                            url: '/topic/' + topicId + '/delete',
                            type: 'get',
                            data: {},
                            dataType: 'json',
                            success: function(result) {
                                if (result.success) {
                                    $('#topic-li-' + topicId).remove();
                                } else {
                                    L.Common.showTipDialog('提示', result.msg);
                                }
                            },
                            error: function() {
                                L.Common.showTipDialog('提示', '删除文章请求发生错误');
                            }
                        });
                    },
                    cancelValue: '取消',
                    cancel: function() {}
                });
                d.show();
            });
        },

        initDeleteComment: function() {
            $(document).on('click', '.delete-comment', function() {
                var commentId = $(this).attr('data-id');
                var d = dialog({
                    title: '提示',
                    content: '确定要删除吗?',
                    okValue: '确定',
                    ok: function() {
                        $.ajax({
                            url: '/comment/' + commentId + '/delete',
                            type: 'get',
                            data: {},
                            dataType: 'json',
                            success: function(result) {
                                if (result.success) {
                                    $('#comment-li-' + commentId).remove();
                                } else {
                                    L.Common.showTipDialog('提示', result.msg);
                                }
                            },
                            error: function() {
                                L.Common.showTipDialog('提示', '删除评论请求发生错误');
                            }
                        });
                    },
                    cancelValue: '取消',
                    cancel: function() {}
                });
                d.show();
            });
        },

        initDeleteCollect: function() {
            $(document).on('click', '.delete-collect', function() {
                var topicId = $(this).attr('data-id');
                var d = dialog({
                    title: '提示',
                    content: '确定要删除吗?',
                    okValue: '确定',
                    ok: function() {
                        $.ajax({
                            url: '/topic/cancel_collect',
                            type: 'post',
                            data: {
                                topic_id: topicId
                            },
                            dataType: 'json',
                            success: function(result) {
                                if (result.success) {
                                    $('#collect-li-' + topicId).remove();
                                } else {
                                    L.Common.showTipDialog('提示', result.msg);
                                }
                            },
                            error: function() {
                                L.Common.showTipDialog('提示', '删除收藏请求发生错误');
                            }
                        });
                    },
                    cancelValue: '取消',
                    cancel: function() {}
                });
                d.show();
            });
        },

        initDeleteLike: function() {
            $(document).on('click', '.delete-like', function() {
                var topicId = $(this).attr('data-id');
                var d = dialog({
                    title: '提示',
                    content: '确定要删除吗?',
                    okValue: '确定',
                    ok: function() {
                        $.ajax({
                            url: '/topic/cancel_like',
                            type: 'post',
                            data: {
                                topic_id: topicId
                            },
                            dataType: 'json',
                            success: function(result) {
                                if (result.success) {
                                    $('#like-li-' + topicId).remove();
                                } else {
                                    L.Common.showTipDialog('提示', result.msg);
                                }
                            },
                            error: function() {
                                L.Common.showTipDialog('提示', '删除点赞请求发生错误');
                            }
                        });
                    },
                    cancelValue: '取消',
                    cancel: function() {}
                });
                d.show();
            });
        },

        initRelationOp: function() {
            $(document).on('click', '.follow-btn', function() {
                var op = $(this).attr('data-op');
                var toId = $(this).attr('data-toid');

                if (op === 'follow') {
                    $.ajax({
                        url: '/user/follow',
                        type: 'post',
                        data: {
                            to_id: toId
                        },
                        dataType: 'json',
                        success: function(result) {
                            if (result.success) {
                                _this.updateRelationArea(result, toId, 'unfollow');
                            } else {
                                L.Common.showTipDialog('提示', result.msg);
                            }
                        },
                        error: function() {
                            L.Common.showTipDialog('提示', '关注操作请求发生错误');
                        }
                    });
                } else if (op === 'unfollow') {
                    $.ajax({
                        url: '/user/cancel_follow',
                        type: 'post',
                        data: {
                            to_id: toId
                        },
                        dataType: 'json',
                        success: function(result) {
                            if (result.success) {
                                _this.updateRelationArea(result, toId, 'follow');
                            } else {
                                L.Common.showTipDialog('提示', result.msg);
                            }
                        },
                        error: function() {
                            L.Common.showTipDialog('提示', '取消关注操作请求发生错误');
                        }
                    });
                }
            });
        },

        updateRelationArea: function(result, toId, op) {
            var relation = result.data.relation;
            var relationTextMap = {
                0: '',
                1: '已关注',
                2: 'ta关注了我',
                3: '互相关注'
            };
            var textMap = {
                'follow': '取消关注',
                'unfollow': '关注'
            };

            var tpl = $('#relation-op-area-tpl').html();
            var html = juicer(tpl, {
                user_id: toId,
                op: op,
                relation: relation,
                text: textMap[op],
                relation_text: relationTextMap[relation]
            });
            $('#relation-op-area').html(html);
            $('#fans-count').text(result.data.fans_count);
            $('#follows-count').text(result.data.follows_count);
        },

        // Generic load function
        loadData: function(url, containerId, pageNo, callback) {
            pageNo = pageNo || 1;
            $.ajax({
                url: url,
                type: 'get',
                cache: false,
                data: {
                    page_no: pageNo
                },
                dataType: 'json',
                success: function(result) {
                    if (result.success) {
                        if (callback) {
                            callback(result, pageNo);
                        }
                    } else {
                        $('#' + containerId).html(result.msg);
                    }
                },
                error: function() {
                    $('#' + containerId).html('error to send request.');
                }
            });
        },

        loadUserTopics: function(username, pageNo) {
            _this.loadData('/user/' + username + '/topics', 'topics-body', pageNo, function(result) {
                _this.pageUserTopics(result, username);
            });
        },

        pageUserTopics: function(result, username) {
            var data = result.data || {};
            var $container = $('#topics-body');
            $container.empty();

            var tpl = $('#topic-item-tpl').html();
            var html = juicer(tpl, data);
            $container.html(html);

            var currentPage = data.currentPage;
            var totalPage = data.totalPage;
            var totalCount = data.totalCount;

            if (totalPage > 1) {
                $('#topics-pagebar').parent().show();
                _this.setupPagination('#topics-pagebar', '/user/' + username + '/topics', 'topics-body', currentPage, totalPage, totalCount, function(data) {
                    return juicer($('#topic-item-tpl').html(), data);
                });
            } else {
                $('#topics-pagebar').parent().hide();
            }
        },

        loadUserComments: function(username, pageNo) {
            _this.loadData('/user/' + username + '/comments', 'comments-body', pageNo, function(result) {
                _this.pageUserComments(result, username);
            });
        },

        pageUserComments: function(result, username) {
            var data = result.data || {};
            var $container = $('#comments-body');
            $container.empty();

            var tpl = $('#comment-item-tpl').html();
            var comments = data.comments || [];
            for (var i = 0; i < comments.length; i++) {
                comments[i].comment_content = L.Common.md.render(comments[i].comment_content);
            }
            var html = juicer(tpl, result.data);
            $container.html(html);
            for (var i = 0; i < comments.length; i++) {
                emojify.run(document.getElementById('reply_' + comments[i].comment_id));
            }

            var currentPage = data.currentPage;
            var totalPage = data.totalPage;
            var totalCount = data.totalCount;

            if (totalPage > 1) {
                $('#comments-pagebar').parent().show();
                _this.setupPagination('#comments-pagebar', '/user/' + username + '/comments', 'comments-body', currentPage, totalPage, totalCount, function(data) {
                    var comments = data.comments || [];
                    for (var i = 0; i < comments.length; i++) {
                        comments[i].comment_content = L.Common.md.render(comments[i].comment_content);
                    }
                    return juicer($('#comment-item-tpl').html(), data);
                });
            } else {
                $('#comments-pagebar').parent().hide();
            }
        },

        loadUserCollects: function(username, pageNo) {
            _this.loadData('/user/' + username + '/collects', 'collects-body', pageNo, function(result) {
                _this.pageUserCollects(result, username);
            });
        },

        pageUserCollects: function(result, username) {
            var data = result.data || {};
            var $container = $('#collects-body');
            $container.empty();

            var tpl = $('#collect-item-tpl').html();
            var html = juicer(tpl, data);
            $container.html(html);

            var currentPage = data.currentPage;
            var totalPage = data.totalPage;
            var totalCount = data.totalCount;

            if (totalPage > 1) {
                $('#collects-pagebar').parent().show();
                _this.setupPagination('#collects-pagebar', '/user/' + username + '/collects', 'collects-body', currentPage, totalPage, totalCount, function(data) {
                    return juicer($('#collect-item-tpl').html(), data);
                });
            } else {
                $('#collects-pagebar').parent().hide();
            }
        },

        loadUserFollows: function(username, pageNo) {
            _this.loadData('/user/' + username + '/follows', 'follows-body', pageNo, function(result) {
                _this.pageUserFollows(result, username);
            });
        },

        pageUserFollows: function(result, username) {
            var data = result.data || {};
            var $container = $('#follows-body');
            $container.empty();

            var tpl = $('#follow-item-tpl').html();
            var html = juicer(tpl, data);
            $container.html(html);

            var currentPage = data.currentPage;
            var totalPage = data.totalPage;
            var totalCount = data.totalCount;

            if (totalPage > 1) {
                $('#follows-pagebar').parent().show();
                _this.setupPagination('#follows-pagebar', '/user/' + username + '/follows', 'follows-body', currentPage, totalPage, totalCount, function(data) {
                    return juicer($('#follow-item-tpl').html(), data);
                });
            } else {
                $('#follows-pagebar').parent().hide();
            }
        },

        loadUserFans: function(username, pageNo) {
            _this.loadData('/user/' + username + '/fans', 'fans-body', pageNo, function(result) {
                _this.pageUserFans(result, username);
            });
        },

        pageUserFans: function(result, username) {
            var data = result.data || {};
            var $container = $('#fans-body');
            $container.empty();

            var tpl = $('#fan-item-tpl').html();
            var html = juicer(tpl, data);
            $container.html(html);

            var currentPage = data.currentPage;
            var totalPage = data.totalPage;
            var totalCount = data.totalCount;

            if (totalPage > 1) {
                $('#fans-pagebar').parent().show();
                _this.setupPagination('#fans-pagebar', '/user/' + username + '/fans', 'fans-body', currentPage, totalPage, totalCount, function(data) {
                    return juicer($('#fan-item-tpl').html(), data);
                });
            } else {
                $('#fans-pagebar').parent().hide();
            }
        },

        loadUserHotTopics: function(username, pageNo) {
            _this.loadData('/user/' + username + '/hot_topics', 'hot-topics-body', pageNo, function(result) {
                _this.pageUserHotTopics(result, username);
            });
        },

        pageUserHotTopics: function(result, username) {
            var data = result.data || {};
            var $container = $('#hot-topics-body');
            $container.empty();

            var tpl = $('#hot-topic-item-tpl').html();
            var html = juicer(tpl, data);
            $container.html(html);

            var currentPage = data.currentPage;
            var totalPage = data.totalPage;
            var totalCount = data.totalCount;

            if (totalPage > 1) {
                $('#hot-topics-pagebar').parent().show();
                _this.setupPagination('#hot-topics-pagebar', '/user/' + username + '/hot_topics', 'hot-topics-body', currentPage, totalPage, totalCount, function(data) {
                    return juicer($('#hot-topic-item-tpl').html(), data);
                });
            } else {
                $('#hot-topics-pagebar').parent().hide();
            }
        },

        loadUserLikeTopics: function(username, pageNo) {
            _this.loadData('/user/' + username + '/like_topics', 'like-topics-body', pageNo, function(result) {
                _this.pageUserLikeTopics(result, username);
            });
        },

        pageUserLikeTopics: function(result, username) {
            var data = result.data || {};
            var $container = $('#like-topics-body');
            $container.empty();

            var tpl = $('#like-topic-item-tpl').html();
            var html = juicer(tpl, data);
            $container.html(html);

            var currentPage = data.currentPage;
            var totalPage = data.totalPage;
            var totalCount = data.totalCount;

            if (totalPage > 1) {
                $('#like-topics-pagebar').parent().show();
                _this.setupPagination('#like-topics-pagebar', '/user/' + username + '/like_topics', 'like-topics-body', currentPage, totalPage, totalCount, function(data) {
                    return juicer($('#like-topic-item-tpl').html(), data);
                });
            } else {
                $('#like-topics-pagebar').parent().hide();
            }
        },

        // Generic pagination setup function
        setupPagination: function(pagebarId, url, containerId, currentPage, totalPage, totalCount, renderCallback) {
            $.fn.jpagebar({
                renderTo: $(pagebarId),
                totalpage: totalPage,
                totalcount: totalCount,
                pagebarCssName: 'pagination2',
                currentPage: currentPage,
                onClickPage: function(pageNo) {
                    $.fn.setCurrentPage(this, pageNo);
                    $.ajax({
                        url: url,
                        type: 'get',
                        cache: false,
                        data: {
                            page_no: pageNo
                        },
                        dataType: 'json',
                        success: function(result) {
                            var data = result.data || {};
                            var $container = $('#' + containerId);
                            $container.empty();
                            var html = renderCallback(data);
                            $container.html(html);
                        },
                        error: function() {
                            $('#' + containerId).html('error to find data page.');
                        }
                    });
                }
            });
        }
    };
}(APP));
