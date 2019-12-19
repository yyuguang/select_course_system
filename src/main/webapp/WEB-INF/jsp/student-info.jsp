<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/global.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>湖北工程学院选课管理系统 - 个人信息</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/js/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/admin.css"/>
</head>
<body>

<div class="layui-tab page-content-wrap">
    <ul class="layui-tab-title">
        <li class="layui-this">修改资料</li>
        <li>修改密码</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form" id="myFrom" style="width: 90%;padding-top: 20px;" enctype="multipart/form-data">
                <div class="layui-form-item">
                    <label class="layui-form-label">编号：</label>
                    <div class="layui-input-block">
                        <input type="hidden" name="stuId" value="${student.stuId}">
                        <input type="text" name="stuCode" readonly autocomplete="off" class="layui-input layui-disabled"
                               value="${student.stuCode}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="stuName" required lay-verify="required" readonly
                               autocomplete="off" value="${student.stuName}" class="layui-input layui-disabled">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别：</label>
                    <div class="layui-input-block">
                        <c:if test="${student.stuSex == 0}">
                            <input type="text" name="stuSex" readonly
                                   autocomplete="off" value="男"
                                   class="layui-input layui-disabled">
                        </c:if>
                        <c:if test="${student.stuSex == 1}">
                            <input type="text" name="stuSex" readonly
                                   autocomplete="off" value="女"
                                   class="layui-input layui-disabled">
                        </c:if>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">出生日期：</label>
                    <div class="layui-input-block">
                        <input type="text" name="stuBirthday" readonly required lay-verify="required"
                               autocomplete="off" class="layui-input layui-disabled" value="${student.stuBirthday}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">电话：</label>
                    <div class="layui-input-block">
                        <input type="text" name="stuPhone" required lay-verify="required" value="${student.stuPhone}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱：</label>
                    <div class="layui-input-block">
                        <input type="text" name="stuEmail" required lay-verify="required" value="${student.stuEmail}"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">院系：</label>
                    <div class="layui-input-block">
                        <input type="text" name="collegeName" value="${student.college.name}"
                               autocomplete="off" class="layui-input layui-disabled">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">专业：</label>
                    <div class="layui-input-block">
                        <input type="text" name="majorName" value="${student.major.name}"
                               autocomplete="off" class="layui-input layui-disabled">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">班级：</label>
                    <div class="layui-input-block">
                        <input type="text" name="gradeName" value="${student.grade.name}"
                               autocomplete="off" class="layui-input layui-disabled">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">年级：</label>
                    <div class="layui-input-block">
                        <input type="text" name="classGrade" value="${student.grade.classGrade}"
                               autocomplete="off" class="layui-input layui-disabled">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">头像:</label>
                    <div class="layui-upload layui-input-block">
                        <input type="hidden" name="file" value="${student.stuImg}" required/>
                        <button type="button" class="layui-btn layui-btn-primary" id="fileBtn">
                            <i class="layui-icon">&#xe67c;</i>选择图片
                        </button>
                        <button type="button" class="layui-btn layui-btn-warm" id="uploadBtn">开始上传</button>
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-block">
                        <textarea name="desc" placeholder="请输入内容" readonly
                                  class="layui-textarea layui-disabled"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="adminInfo">立即提交</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="layui-tab-item">
            <form class="layui-form" method="post" style="width: 90%;padding-top: 20px;">
                <div class="layui-form-item">
                    <label class="layui-form-label">编号：</label>
                    <div class="layui-input-block">
                        <input type="hidden" name="stuId" value="${student.stuId}">
                        <input type="text" disabled autocomplete="off"
                               class="layui-input layui-disabled" value="${student.stuCode}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" disabled autocomplete="off"
                               class="layui-input layui-disabled" value="${student.stuName}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">旧密码：</label>
                    <div class="layui-input-block">
                        <input type="password" name="stuPassword" required lay-verify="required" placeholder="请输入密码"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">新密码：</label>
                    <div class="layui-input-block">
                        <input type="password" name="newPassword" required lay-verify="required" placeholder="请输入密码"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">确认密码：</label>
                    <div class="layui-input-block">
                        <input type="password" name="password3" required lay-verify="required|confirmPass" placeholder="请输入密码"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="adminPassword">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="${path}/static/js/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use(['form', 'jquery', 'layer', 'upload','element'], function () {
        var form = layui.form,
            upload = layui.upload,
            layer = layui.layer,
            element = layui.element,
            $ = layui.jquery;
        form.render();

        //监听密码提交
        form.on('submit(adminPassword)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });

        upload.render({
            elem: '#fileBtn',
            url: '/student/upload',
            accept: 'file',//普通文件
            auto: false,
            bindAction: '#uploadBtn',
            done: function (res) {
               if(res.success){
                   layer.msg("更新成功，重新登陆后立即生效", {offset: '60px', icon: 6, anim: 6, time: 1000});
               }
            }
        });
        let isEdit = false;
        $('#myFrom').change(function () {
            isEdit = true;
        });

        //监听信息提交
        form.on('submit(adminInfo)', function (data) {
            if (!isEdit) {
                layer.msg('你没有修改数据', {offset: '60px', icon: 6, anim: 6, time: 3000});
                return;
            }
            $.ajax({
                type: "post",
                dataType: 'json',
                url: "/student/updateStudent",
                data: {
                    'stuId': data.field.stuId,
                    'stuPhone': data.field.stuPhone,
                    'stuEmail': data.field.stuEmail
                },
                success: function (res) {
                    if (res.success) {
                        layer.msg("更新成功", {offset: '60px', icon: 6, anim: 6, time: 1000});
                        location.reload();
                    } else {
                        layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                    }
                },
                error: function (res) {
                    layer.msg(res);
                }
            });

            return false;
        });

        // 校验两次密码是否一致
        form.verify({
            confirmPass:function(value){
                if($('input[name=newPassword]').val() !== value)
                    return '两次密码输入不一致！';
            }
        });

        //监听信息提交
        form.on('submit(adminPassword)', function (data) {
            $.ajax({
                type: "post",
                dataType: 'json',
                url: "/student/updateStudentPassWord",
                data: {
                    'stuId': data.field.stuId,
                    'stuPassword': data.field.stuPassword,
                    'newPassword': data.field.newPassword
                },
                success: function (res) {
                    if (res.success) {
                        layer.msg("更新成功", {offset: '60px', icon: 6, anim: 6, time: 1000});
                        location.reload();
                    } else {
                        layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                    }
                },
                error: function (res) {
                    layer.msg(res);
                }
            });

            return false;
        });
    });
</script>
</body>
</html>