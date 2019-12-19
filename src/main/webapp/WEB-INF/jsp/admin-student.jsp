<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/global.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>湖北工程学院选课管理系统 - 学生管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/js/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/static/css/admin.css"/>
</head>
<body class="iframe-h gray-bg">
<div class="wrap-container column-wrap clearfix">
    <div class="column-content">
        <div class="">
            <form class="layui-form" action="">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <select name="collegeId" id="collegeId" lay-filter="status">
                            <option value="">请选择一个院系</option>
                            <c:forEach items="${collegeList}" var="college">
                                <option value="${college.id}">${college.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button class="layui-btn layui-btn-normal" onclick="findAllByCollegeId();">搜索</button>
                </div>
            </form>
            <div class="layui-form" id="table-list">
                <table class="layui-table" lay-even lay-skin="nob">
                    <colgroup>
                        <col width="20">
                        <col class="hidden-xs" width="100">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="150">
                        <col class="hidden-xs" width="150">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="150">
                        <col class="hidden-xs" width="150">
                        <col class="hidden-xs" width="100">
                        <col class="hidden-xs" width="200">
                        <col width="150">
                    </colgroup>
                    <thead>
                    <tr>
                        <th></th>
                        <th class="hidden-xs">ID</th>
                        <th>学号</th>
                        <th>姓名</th>
                        <th>性别</th>
                        <th>院系</th>
                        <th>专业</th>
                        <th>班级</th>
                        <th>年级</th>
                        <th class="hidden-xs">创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${studentList}" var="student" varStatus="index">
                        <tr>
                            <th></th>
                            <th class="hidden-xs">${index.index + 1}</th>
                            <th>${student.stuCode}</th>
                            <th>${student.stuName}</th>
                            <th>
                                <c:if test="${student.stuSex == 0}">
                                    男
                                </c:if>
                                <c:if test="${student.stuSex == 1}">
                                    女
                                </c:if>
                            </th>
                            <th>${student.college.name}</th>
                            <th>${student.major.name}</th>
                            <th>${student.grade.name}</th>
                            <th>${student.grade.classGrade}</th>
                            <th class="hidden-xs">
                                <fmt:formatDate value="${student.createTime}" pattern="yyyy年MM月dd日"/>
                            </th>
                            <td>
                                <a class="layui-btn layui-btn-small layui-btn-normal" data-id="1"
                                   onclick="studentInfo('${student.stuId}');"><i
                                        class="layui-icon">&#xe656;</i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="layui-row" id="studentInfo" style="display: none;">
    <div class="layui-col-md10">
        <form class="layui-form" action="">
            <div class="layui-form-item" style="margin-top: 50px">
                <label class="layui-form-label">学号</label>
                <div class="layui-input-block">
                    <input id="stuCode" type="text" name="stuCode" readonly class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-block">
                    <input id="stuName" type="text" name="stuName" readonly class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-block">
                    <input id="stuSex" type="text" name="stuSex" readonly class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">邮箱</label>
                <div class="layui-input-block">
                    <input id="stuEmail" type="text" name="stuEmail" readonly class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">电话</label>
                <div class="layui-input-block">
                    <input id="stuPhone" type="text" name="stuPhone" readonly class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">生日</label>
                <div class="layui-input-block">
                    <input id="stuBirthday" type="text" name="stuBirthday" readonly class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">院系名称</label>
                <div class="layui-input-block">
                    <input id="college" type="text" name="college" readonly class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">专业名称</label>
                <div class="layui-input-block">
                    <input id="major" type="text" name="major" readonly class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">班级</label>
                <div class="layui-input-block">
                    <input id="grade" type="text" name="grade" readonly class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">年级</label>
                <div class="layui-input-block">
                    <input id="classGrade" type="text" name="classGrade" readonly class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">创建时间</label>
                <div class="layui-input-block">
                    <input id="createTime" type="text" name="createTime" readonly class="layui-input">
                </div>
            </div>
        </form>
    </div>
</div>

<script src="${path}/static/js/layui/layui.js" type="text/javascript" charset="utf-8"></script>


<script>
    layui.use(['jquery', 'layer', 'form'], function () {
        var layer = layui.layer,
            form = layui.form,
            $ = layui.jquery;


        window.studentInfo = function (res) {
            $.ajax({
                url: "/admin/getStudentById",
                data: {"stuId": res},
                type: "post",
                dataType: "json",
                success: function (response) {
                    if (response.success) {
                        $('#stuCode').val(response.data.stuCode);
                        $('#stuName').val(response.data.stuName);
                        if(response.data.stuSex === 0){
                            $('#stuSex').val('男');
                        }else{
                            $('#stuSex').val('女');
                        }
                        var stuBirthday = format(response.data.stuBirthday, 'yyyy-MM-dd');
                        $('#stuBirthday').val(stuBirthday);
                        $('#stuEmail').val(response.data.stuEmail);
                        $('#stuPhone').val(response.data.stuPhone);
                        $('#college').val(response.data.college.name);
                        $('#major').val(response.data.major.name);
                        $('#grade').val(response.data.grade.name);
                        $('#classGrade').val(response.data.grade.classGrade);
                        var createTime = format(response.data.createTime, 'yyyy-MM-dd HH:mm:ss');
                        $('#createTime').val(createTime);
                        layer.open({
                            type: 1,
                            title: "学生详情",
                            area: ['600px', '750px'],
                            content: $("#studentInfo"),
                            btn: ['关闭'],
                            yes: function (index, layero) {
                                layer.close(index);
                            },
                            btn2: function (index, layero) {
                                layer.close(index);
                            }
                        });
                    } else {
                        console.log("错误信息是: " + res.msg);
                        layer.msg(response.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                    }
                },
                error: function (res) {
                    console.info(res);
                }
            });

        };


        /**
         * 格式化时间
         * 实现思路：获得毫秒数 再转化为需要时间格式。形如：yyyy-MM-dd
         * @param time
         * @param format
         * @returns {void | string}
         */
        window.format = function (time, format) {
            var t = new Date(time);
            var tf = function (i) {
                return (i < 10 ? '0' : '') + i
            };
            return format.replace(/yyyy|MM|dd|HH|mm|ss/g,
                function (a) {
                    switch (a) {
                        case 'yyyy':
                            return tf(t.getFullYear());
                            break;
                        case 'MM':
                            return tf(t.getMonth() + 1);
                            break;
                        case 'mm':
                            return tf(t.getMinutes());
                            break;
                        case 'dd':
                            return tf(t.getDate());
                            break;
                        case 'HH':
                            return tf(t.getHours());
                            break;
                        case 'ss':
                            return tf(t.getSeconds());
                            break;
                    }
                });
        }
    })


</script>

</body>

</html>