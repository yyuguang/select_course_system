<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>湖北工程学院选课管理系统 - 注册</title>
    <link rel="stylesheet" type="text/css" href="static/js/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/login.css"/>
</head>

<body>
<div class="m-login-bg">
    <div class="m-login-register m-login">
        <h3>选课管理系统 - 注册</h3>
        <div class="m-login-warp">
            <form class="layui-form" id="register" method="post">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">用户类型</label>
                        <div class="layui-input-block">
                            <select name="stuType" lay-verify="required">
                                <option value=""></option>
                                <option value="1">学生</option>
                                <option value="2">教师</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">院系</label>
                        <div class="layui-input-block">
                            <select name="collegeId" id="college" lay-filter="college" lay-verify="required">
                                <option value="">请选择院系</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <label class="layui-form-label">专业</label>
                        <div class="layui-input-block">
                            <select name="majorId" id="major" lay-filter="major" lay-verify="required">
                                <option value="">请选择专业</option>
                            </select>
                        </div>
                    </div>

                    <div class="layui-inline">
                        <label class="layui-form-label">班级</label>
                        <div class="layui-input-block">
                            <select name="gradeId" id="grade" lay-verify="required">
                                <option value="">请选择班级</option>
                            </select>
                        </div>
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">编号</label>
                    <div class="layui-input-block">
                        <input type="text" name="stuCode" required lay-verify="required|stuCode" placeholder="请输入编号"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="stuPassword" required lay-verify="required|stuPassword"
                               placeholder="请输入密码"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="stuName" required lay-verify="required" placeholder="请输入姓名"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="stuSex" value="0" title="男" checked>
                        <input type="radio" name="stuSex" value="1" title="女">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">出生日期</label>
                    <div class="layui-input-block">
                        <input type="text" name="stuBirthday" readonly required id="birthday" lay-verify="required"
                               placeholder="请选择日期"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">电话</label>
                    <div class="layui-input-block">
                        <input type="text" name="stuPhone" required lay-verify="required|stuPhone" placeholder="请输入电话"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱</label>
                    <div class="layui-input-block">
                        <input type="email" name="stuEmail" required lay-verify="required" placeholder="请输入邮箱"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>

                <div class="layui-form-item m-login-btn">
                    <div class="layui-inline">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="register">注册</button>
                    </div>
                    <div class="layui-inline">
                        <button type="button" onclick="window.location.href = 'login.jsp'"
                                class="layui-btn layui-btn-primary">登录
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
    layui.use(['form', 'laydate', 'jquery'], function () {
        var form = layui.form,
            $ = layui.jquery,
            layer = layui.layer;


        //自定义验证规则
        form.verify({
            stuCode: function (value) {
                if (value.length != 12) {
                    return '请输入正确的12为编号';
                }
            },
            stuPassword: [/(.+){6,12}$/, '密码必须6到12位'],
            stuPhone: [/^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/, '请输入正确的11位电话号码']
        });


        //监听提交
        form.on('submit(register)', function (data) {
            $.ajax({
                type: "post",
                dataType : 'json',
                contentType: "application/json;charset=UTF-8",
                url: "/login/register",
                data: JSON.stringify(data.field),
                success: function (res) {
                    if (res.success) {
                        layer.msg( "注册成功" ,{offset: '60px',icon: 6,anim: 6,time: 1000});
                        window.location.href='../login.jsp';
                    }else{
                        layer.msg(res.msg ,{offset: '60px',icon: 5,anim: 6,time: 3000});
                    }
                },
                error: function (res) {
                    layer.msg(res);
                }
            });

            return false;
        });

        var laydate = layui.laydate;

        //日期时间选择器
        laydate.render({
            elem: '#birthday',
            type: 'datetime'
        });

        //加载院系
        $(document).ready(function () {
            $.ajax({
                type: "get",
                dataType: "json",
                url: "/college/findAllCollege",
                success: function (res) {
                    if (res.success) {
                        for (var i = 0; i < res.data.length; i++) {
                            $("#college").append("<option value='" + res.data[i].id + "'>" + res.data[i].name + "</option>");
                        }
                        form.render("select");
                    } else {
                        layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                    }
                },
                error: function (res) {
                    layer.msg(res);
                }
            });
        });

        //加载专业
        form.on('select(college)', function (data) {
            var val = data.value;
            if (val == null || val == '') {
                return;
            }
            $.ajax({
                type: "get",
                dataType: "json",
                url: "/major/findAllByCollegeId",
                data: {
                    'id': val
                },
                success: function (res) {
                    if (res.success) {
                        $('#major').empty();
                        $('#grade').empty();
                        $("#major").append("<option value=''>请选择专业</option>");
                        $("#grade").append("<option value=''>请选择班级</option>");
                        for (var i = 0; i < res.data.length; i++) {
                            $("#major").append("<option value='" + res.data[i].id + "'>" + res.data[i].name + "</option>");
                        }
                        form.render("select");
                    } else {
                        layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                    }
                },
                error: function (res) {
                    layer.msg(res);
                }
            });
        });

        //加载班级
        form.on('select(major)', function (data) {
            var val = data.value;
            if (val == null || val == '') {
                return;
            }
            $.ajax({
                type: "get",
                dataType: "json",
                url: "/grade/findAllByMajorId",
                data: {
                    'id': val
                },
                success: function (res) {
                    console.info(res);
                    if (res.success) {
                        if (res.data != null) {
                            $('#grade').empty();
                            $("#grade").append("<option value=''>请选择班级</option>");
                            for (var i = 0; i < res.data.length; i++) {
                                $("#grade").append("<option value='" + res.data[i].id + "'>" + res.data[i].name + "</option>");
                            }
                            form.render("select");
                        } else {
                            layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                        }
                    } else {
                        layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
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