(function(L) {
    var _this = null;
    L.Settings = L.Settings || {};
    _this = L.Settings = {
        data: {},

        init: function() {
            _this.initEvents();
            _this.initUploader();
        },

        initEvents: function() {
            $('#edit-user-btn').click(function() {
                $('#edit-user-result').hide();
                $.ajax({
                    url: '/user/edit',
                    type: 'post',
                    data: {
                        email: $('input[name=email]').val(),
                        email_public: $('#user_email_public').prop('checked') ? 1 : 0,
                        city: $('input[name=city]').val(),
                        company: $('input[name=company]').val(),
                        github: $('input[name=github]').val(),
                        website: $('input[name=website]').val(),
                        sign: $('input[name=sign]').val()
                    },
                    dataType: 'json',
                    success: function(result) {
                        if (result.success) {
                            window.location.href = '/settings';
                        } else {
                            _this.showUploadResult(false, '编辑资料失败，请重试');
                        }
                    },
                    error: function() {
                        $('#edit-user-result').show();
                        _this.showUploadResult(false, '编辑资料发生错误，请重试');
                    }
                });
            });

            $('#edit-user-pwd-btn').click(function() {
                $('#edit-user-pwd-result').hide();
                var oldPwd = $('input[name=current_password]').val();
                var newPwd = $('input[name=password]').val();
                var confirmPwd = $('input[name=password_confirm]').val();

                if (!newPwd || !oldPwd) {
                    _this.showUploadResult(false, '输入的密码不能为空');
                    return;
                }

                if (newPwd !== confirmPwd) {
                    _this.showUploadResult(false, '两次输入的新密码不一致');
                    return;
                }

                $.ajax({
                    url: '/user/change_pwd',
                    type: 'post',
                    data: {
                        old_pwd: hex_md5(oldPwd + L.pwd_secret),
                        new_pwd: hex_md5(newPwd + L.pwd_secret)
                    },
                    dataType: 'json',
                    success: function(result) {
                        if (result.success) {
                            _this.showUploadResult(true, '修改密码成功!');
                        } else {
                            _this.showUploadResult(false, result.msg);
                        }
                    },
                    error: function() {
                        _this.showUploadResult(false, '修改密码发生错误，请重试');
                    }
                });
            });
        },

        showUploadResult: function(ok, content) {
            var $result = $('#edit-user-pwd-result');
            var $alertDiv = $result.find('div').removeClass('alert-success alert-danger').addClass('alert-' + (ok ? 'success' : 'danger'));
            $alertDiv.html(content);
            $result.show();
        },

        initUploader: function() {
            $('#avatar_image').fileupload({
                url: '/upload/avatar',
                sequentialUploads: true,
                fail: function(e, data) {
                    $('#upload_result_tip').html('<span class="text-danger">更改头像发生错误，请检查文件大小和格式</span>');
                }
            }).bind('fileuploadprogress', function(e, data) {
                var progress = parseInt(data.loaded / data.total * 100, 10);
                $('#avatar_upload_progress').css('width', progress + '%');
                $('#avatar_upload_progress').html(progress + '%');
            }).bind('fileuploaddone', function(e, data) {
                var result = data.result || {};
                if (result.success && result.filename) {
                    var avatarPath = '/static/avatar/' + result.filename;
                    $('#avatar_show').attr('src', avatarPath);
                    $('#my_avatar').attr('src', avatarPath);
                    $('#upload_result_tip').html('');
                } else {
                    var msg = result.msg ? ': ' + result.msg : '';
                    $('#upload_result_tip').html('<span class="text-danger">更改头像失败' + msg + '</span>');
                }
            });
        }
    };
}(APP));
