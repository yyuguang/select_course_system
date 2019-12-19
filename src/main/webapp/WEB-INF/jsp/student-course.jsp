<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/global.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>湖北工程学院选课管理系统 - 学生选课管理</title>
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
        <li class="layui-this">已选课程</li>
        <li>新增选修</li>
    </ul>

    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="layui-form" id="table-list">
                <table class="layui-table" lay-skin="line">
                    <colgroup>
                        <col width="50">
                        <col class="hidden-xs" width="150">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="200">
                    </colgroup>
                    <thead>
                    <tr>
                        <th></th>
                        <th class="hidden-xs">课程编号</th>
                        <th class="hidden-xs">课程名称</th>
                        <th class="hidden-xs">课程类型</th>
                        <th class="hidden-xs">课程学时</th>
                        <th class="hidden-xs">课程学分</th>
                        <th>任课教师</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${selectCourseList}" var="selectCourse" varStatus="index">
                        <tr class="parent collapsed">
                            <td></td>
                            <td class="hidden-xs">${index.index + 1}</td>
                            <td class="hidden-xs">${selectCourse.courseName}</td>
                            <td>${selectCourse.courseType.name}</td>
                            <td>${selectCourse.courseCycle}</td>
                            <td>${selectCourse.courseCredit}</td>
                            <td>${selectCourse.courseTeacher.stuName}</td>
                            <td>
                                <div class="layui-inline">
                                    <button class="layui-btn layui-btn-mini layui-btn-normal"
                                            onclick="studentCourseInfo('${selectCourse.courseId}');"><i
                                            class="layui-icon">&#xe705;</i></button>
                                    <button class="layui-btn layui-btn-mini layui-btn-danger"
                                            onclick="cancelStudentCourse('${selectCourse.courseId}');">
                                        退选
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="layui-tab-item">
            <div class="layui-form-item">
                <form action="#" class="layui-form">
                    <div class="layui-inline">
                        <select class="layui-select" id="courseTypeId" name="courseTypeId">
                            <option value="" selected disabled style="display: none;">请选择课程类型</option>
                            <c:forEach items="${courseTypeList}" var="courseType">
                                <option value="${courseType.id}">${courseType.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button class="layui-btn layui-btn-normal" onclick="findAllByCourseNameOrCourseTypeId();">搜索
                    </button>
                </form>
            </div>
            <div class="layui-form">
                <table class="layui-table" lay-skin="line">
                    <colgroup>
                        <col width="50">
                        <col class="hidden-xs" width="150">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="200">
                    </colgroup>
                    <thead>
                    <tr>
                        <th></th>
                        <th class="hidden-xs">课程编号</th>
                        <th class="hidden-xs">课程名称</th>
                        <th class="hidden-xs">课程类型</th>
                        <th class="hidden-xs">课程学时</th>
                        <th class="hidden-xs">课程学分</th>
                        <th class="hidden-xs">对应年级</th>
                        <th>任课教师</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${courseList}" var="course" varStatus="index">
                        <tr class="parent collapsed">
                            <td></td>
                            <td class="hidden-xs">${index.index + 1}</td>
                            <td class="hidden-xs">${course.courseName}</td>
                            <td>${course.courseType.name}</td>
                            <td>${course.courseCycle}</td>
                            <td>${course.courseCredit}</td>
                            <td>${course.courseGrade}</td>
                            <td>${course.courseTeacher.stuName}</td>
                            <td>
                                <div class="layui-inline">
                                    <button class="layui-btn layui-btn-mini layui-btn-normal"
                                            onclick="selectCourse('${course.courseId}');">选课
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="layui-row" id="studentCourseInfo" style="display: none;">
    <div class="layui-col-md10">
        <div class="layui-form-item" style="margin-top: 50px">
            <label class="layui-form-label">当前成绩</label>
            <div class="layui-input-block">
                <input type="text" name="grade" id="grade" readonly class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">选课时间</label>
            <div class="layui-input-block">
                <input type="text" name="createTime" id="createTime" readonly class="layui-input">
            </div>
        </div>
    </div>
</div>


<script src="${path}/static/js/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script>
    layui.use(['form', 'element', 'jquery', 'layer'], function () {
        var form = layui.form,
            $ = layui.jquery,
            layer = layui.layer,
            element = layui.element;

        /**
         * 条件筛选课程
         *
         */
        window.findAllByCourseNameOrCourseTypeId = function () {
            const courseTypeId = $('#courseTypeId').val();
            if(courseTypeId === undefined){
                layer.msg('请选择课程类型', {offset: '60px', icon: 5, anim: 6, time: 3000});
                return;
            }

            $.ajax({
                type: "get",
                url: "/studentCourse/listStudentCourse",
                data: {
                    'courseTypeId': $('#courseTypeId').val()
                },
                dataType: 'json',
                success: function (res) {
                    if (res.success) {
                        layer.msg("选课成功", {offset: '60px', icon: 6, anim: 6, time: 1000});
                        location.reload();
                    } else {
                        layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                    }
                debugger;
                },
                error: function (res) {
                    layer.msg(res);
                debugger;
                }
            })

        }

        /**
         * 选课
         * @param res
         */
        window.selectCourse = function (res) {
            layer.confirm('确定选择该课程吗？', {btn: ['确定', '取消'], title: "提示"}, function () {
                $.ajax({
                    type: "POST",
                    url: "/studentCourse/studentSelectCourse",
                    data: {
                        'courseId': res
                    },
                    dataType: 'json',
                    success: function (res) {
                        if (res.success) {
                            layer.msg("选课成功", {offset: '60px', icon: 6, anim: 6, time: 1000});
                            location.reload();
                        } else {
                            layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                        }
                    },
                    error: function (res) {
                        layer.msg(res);
                    }
                });
            });
        }

        /**
         * 退选
         * @param res
         */
        window.cancelStudentCourse = function (res) {
            layer.confirm('确定退选该课程吗？', {btn: ['确定', '取消'], title: "提示"}, function () {
                $.ajax({
                    type: "POST",
                    url: "/studentCourse/cancelStudentCourse",
                    data: {
                        'courseId': res
                    },
                    dataType: 'json',
                    success: function (res) {
                        if (res.success) {
                            layer.msg("退选成功", {offset: '60px', icon: 6, anim: 6, time: 1000});
                            location.reload();
                        } else {
                            layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                        }
                    },
                    error: function (res) {
                        layer.msg(res);
                    }
                });
            });
        }

        /**
         * 学生已选课程详情
         * @param res
         */
        window.studentCourseInfo = function (res) {
            $.ajax({
                type: "get",
                url: "/studentCourse/getScById",
                data: {
                    'courseId': res
                },
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        $('#grade').val(response.data.score);
                        var formatDate = format(response.data.createTime, 'yyyy-MM-dd HH:mm:ss');
                        $('#createTime').val(formatDate);
                        layer.open({
                            type: 1,
                            title: "课程详情",
                            area: ['500px', '300px'],
                            content: $("#studentCourseInfo"),
                            btn: ['关闭'],
                            yes: function (index, layero) {
                                layer.close(index);
                            },
                            btn2: function (index, layero) {
                                layer.close(index);
                            }
                        });
                    } else {
                        layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                    }
                },
                error: function (res) {
                    layer.msg(res);
                }
            });


        }

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