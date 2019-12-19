<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ include file="/commons/global.jsp" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>湖北工程学院选课管理系统 - 登录</title>
    <link rel="stylesheet" type="text/css" href="${path}/static/js/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/login.css"/>
</head>

<body>
<div class="m-login-bg">
    <div class="m-login">
        <h3>选课管理系统 - 登录</h3>
        <div class="m-login-warp">
            <form class="layui-form" name="loginForm" id="loginForm" method="post">
                <div class="layui-form-item">
                    <input type="text" name="username" required lay-verify="required" placeholder="用户名"
                           autocomplete="off"
                           class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="password" name="password" required lay-verify="required" placeholder="密码"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-item">
                    <input type="radio" name="role" value="0" title="管理员">
                    <input type="radio" name="role" value="1" title="学生" checked>
                    <input type="radio" name="role" value="2" title="教师">
                </div>
                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="login">登录</button>
                    </div>
                    <div class="layui-inline">
                        <button type="button" onclick="window.location.href = 'register.jsp'"
                                class="layui-btn layui-btn-primary">注册
                        </button>
                    </div>
                </div>

            </form>
        </div>
        <p class="copyright">Copyright 2019-2020 by LNZZ</p>
    </div>
</div>
<script src="static/js/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate', 'jquery'], function () {
        var form = layui.form,
            $ = layui.jquery,
            layer = layui.layer;


        //监听提交
        form.on('submit(login)', function (data) {
            $.ajax({
                url: '/login/login',
                type: 'POST',
                data: {
                    'username': data.field.username,
                    'password': data.field.password,
                    'role': data.field.role
                },
                dataType: 'json',
                success: function (res) {
                    if (res.success) {
                        layer.msg( "登录成功" ,{offset: '60px',icon: 6,anim: 6,time: 1000});
                        window.location.href='${path}/index.do';
                    }else{
                        console.log("错误信息是: " + res.msg);
                        layer.msg(res.msg ,{offset: '60px',icon: 5,anim: 6,time: 3000});
                    }
                },
                error: function (res) {
                    layer.msg(res);
                }
            });
        });

    });

</script>
</body>

</html>