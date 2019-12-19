<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/global.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>湖北工程学院选课管理系统 - 教师选课管理</title>
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
        <li class="layui-this">已开课程</li>
        <li>课程管理</li>
        <li>新增选修</li>
    </ul>

    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <div class="layui-form" id="table-list">
                <table class="layui-table" lay-skin="line">
                    <colgroup>
                        <col width="100">
                        <col class="hidden-xs" width="150">
                        <col class="hidden-xs" width="300">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="150">
                        <col width="150">
                        <col width="250">
                    </colgroup>
                    <thead>
                    <tr>
                        <th></th>
                        <th class="hidden-xs">课程编号</th>
                        <th class="hidden-xs">课程名称</th>
                        <th class="hidden-xs">课程类型</th>
                        <th>课程学时</th>
                        <th>课程学分</th>
                        <th>对应年级</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${teacherList}" varStatus="index" var="teacher">
                        <tr class="parent collapsed">
                            <td></td>
                            <td class="hidden-xs">${index.index+ 1}</td>
                            <td class="hidden-xs">${teacher.courseName}</td>
                            <td>${teacher.courseType.name}</td>
                            <td>${teacher.courseCycle}</td>
                            <td>${teacher.courseCredit}</td>
                            <td>${teacher.courseGrade}</td>
                            <td>
                                <div class="layui-btn-group">
                                    <button type="button" class="layui-btn layui-btn-normal"
                                            onclick="updateInfo('${teacher.courseId}');">
                                        <i class="layui-icon">&#xe642;</i>
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
                        <select class="layui-select" id="selectCourseId" name="selectCourseId">
                            <option value="" selected disabled style="display: none;">请选择课程</option>
                            <c:forEach items="${teacherList}" var="teacher">
                                <option value="${teacher.courseId}">${teacher.courseName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button class="layui-btn layui-btn-normal" onclick="findStudentSelectCourseByCourseId();">搜索
                    </button>
                </form>
            </div>
            <c:if test="${studentList != null}">
                <div class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">课程名称：</label>
                        <span style="line-height: 38px;font-weight: 600;color: red;">
                                ${course.courseName}
                        </span>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">学生人数：</label>
                        <span style="line-height: 38px;font-weight: 600;color: red;">
                            ${studentList.size()}人
                        </span>
                    </div>
                    <table class="layui-table" lay-skin="line">
                        <colgroup>
                            <col width="50">
                            <col class="hidden-xs" width="150">
                            <col class="hidden-xs" width="220">
                            <col class="hidden-xs" width="200">
                            <col class="hidden-xs" width="220">
                            <col class="hidden-xs" width="220">
                            <col width="200">
                            <col width="200">
                        </colgroup>
                        <thead>
                        <tr>
                            <th></th>
                            <th class="hidden-xs">学生编号</th>
                            <th class="hidden-xs">学生学号</th>
                            <th class="hidden-xs">学生姓名</th>
                            <th class="hidden-xs">学生院系</th>
                            <th class="hidden-xs">学生专业</th>
                            <th class="hidden-xs">学生班级</th>
                            <th class="hidden-xs">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${studentList}" var="student" varStatus="index">
                            <tr class="parent collapsed">
                                <td></td>
                                <td class="hidden-xs">${index.index + 1}</td>
                                <td class="hidden-xs">${student.stuCode}</td>
                                <td>${student.stuName}</td>
                                <td>${student.college.name}</td>
                                <td>${student.major.name}</td>
                                <td>${student.grade.name}</td>
                                <td>
                                    <div class="layui-btn-group">
                                        <button type="button" class="layui-btn layui-btn-normal"
                                                onclick="updateStudentCourseGrade('${student.stuId}');">
                                            评分
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
        <div class="layui-tab-item">
            <form class="layui-form" style="width: 90%;padding-top: 10px;" action="${path}/teacher/save" method="post">
                <div class="layui-form-item">
                    <label class="layui-form-label">课程名称：</label>
                    <div class="layui-input-block">
                        <input type="text" name="courseName" required lay-verify="required" placeholder="请输入课程名称"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">任课教师：</label>
                    <div class="layui-input-block">
                        <input type="hidden" name="teacherId" value="${student.stuId}">
                        <input type="text" value="${student.stuName}" required lay-verify="required"
                               placeholder="请输入任课教师"
                               autocomplete="off" class="layui-input layui-disabled">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">课程类型：</label>
                    <div class="layui-input-block">
                        <select name="courseTypeId" class="layui-select">
                            <option value="">请选择课程类型</option>
                            <c:forEach items="${courseTypeList}" var="course">
                                <option value="${course.id}">${course.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">课程学时：</label>
                    <div class="layui-input-block">
                        <input type="text" name="courseCycle" required lay-verify="required" placeholder="请输入课程学时"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">学分：</label>
                    <div class="layui-input-block">
                        <input type="text" name="courseCredit" required lay-verify="required" placeholder="请输入学分"
                               autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">对应年级：</label>
                    <div class="layui-input-block">
                        <select name="courseGrade" class="layui-select">
                            <option value="" selected disabled style="display: none;">请选择对应年级</option>
                            <option value="2016">2016级</option>
                            <option value="2017">2017级</option>
                            <option value="2018">2018级</option>
                            <option value="2019">2019级</option>
                        </select>
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">备注</label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" name="remarks" class="layui-textarea"></textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="submit" class="layui-btn layui-btn-normal" lay-submit=""
                                lay-filter="teacherCourseForm">立即提交
                        </button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>


<div class="layui-row" id="InfoUpdate" style="display: none;">
    <div class="wrap-container">
        <form class="layui-form" id="InfoUpdateForm" style="width: 90%;padding-top: 20px;">
            <div class="layui-form-item">
                <label class="layui-form-label">课程名称：</label>
                <div class="layui-input-block">
                    <input type="hidden" name="courseId" id="courseId">
                    <input type="text" name="courseName" id="courseName" required lay-verify="required"
                           placeholder="请输入名称" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">课程类型：</label>
                <div class="layui-input-block">
                    <input type="text" name="courseTypeName" id="courseTypeName" readonly="" required
                           lay-verify="required" placeholder="请输入应用" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">课程学分：</label>
                <div class="layui-input-block">
                    <input type="text" name="courseCredit" id="courseCredit" required lay-verify="required"
                           placeholder="请输入课程学分" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">课程学时：</label>
                <div class="layui-input-block">
                    <input type="text" name="courseCycle" id="courseCycle" required lay-verify="required"
                           placeholder="请输入课程学时" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">对应年级：</label>
                <div class="layui-input-block">
                    <input type="text" name="courseGrade" id="courseGrade" readonly required lay-verify="required"
                           placeholder="请输入对应年级" autocomplete="off" class="layui-input">
                </div>

            </div>
            <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-block">
                    <textarea name="remarks" id="remarks" placeholder="请输入内容" class="layui-textarea"></textarea>
                </div>
            </div>

        </form>
    </div>
</div>


<div class="layui-row" id="studentCourseInfo" style="display: none;">
    <div class="layui-col-md10">
        <div class="layui-form-item" style="margin-top: 50px">
            <label class="layui-form-label">当前成绩</label>
            <div class="layui-input-block">
                <input type="text" name="grade" id="grade" autofocus required lay-verify="required" class="layui-input">
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
             *
             * 修改学生成绩
             **/
            window.updateStudentCourseGrade = function (res) {
                $.ajax({
                    type: "get",
                    url: "/teacher/getScById",
                    data: {
                        'studentId': res
                    },
                    dataType: 'json',
                    success: function (response) {
                        if (response.success) {
                            $('#grade').val(response.data.score);
                            var formatDate = format(response.data.createTime, 'yyyy-MM-dd HH:mm:ss');
                            $('#createTime').val(formatDate);
                            layer.open({
                                type: 1,
                                title: "课程评分",
                                area: ['500px', '300px'],
                                content: $("#studentCourseInfo"),
                                btn: ['确定', '关闭'],
                                yes: function (index, layero) {
                                    $.ajax({
                                        type: "post",
                                        url: "/teacher/updateScoreByByCourseIdAndStudentId",
                                        data: {
                                            'studentId': res,
                                            'score': $('#grade').val()
                                        },
                                        dataType: 'json',
                                        success: function (response) {
                                            if (response.success) {
                                                layer.msg("更新成功", {offset: '60px', icon: 6, anim: 6, time: 1000});
                                                layer.close(index);
                                                location.reload();
                                            } else {
                                                layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                                            }
                                        },
                                        error: function (res) {
                                            layer.msg(res);
                                        }
                                    });
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

            /**
             * 查询选课学生信息
             * @returns {boolean}
             */
            window.findStudentSelectCourseByCourseId = function () {
                const selectCourseId = $('#selectCourseId').val();
                if (selectCourseId === '' || selectCourseId === undefined) {
                    layer.msg('请选择课程', {offset: '60px', icon: 5, anim: 6, time: 3000});
                    return false;
                }

                $.ajax({
                    type: "post",
                    dataType: 'json',
                    url: "/teacher/listTeacherCourse",
                    data: {
                        'courseId': $('#selectCourseId').val()
                    },
                    success: function (res) {

                    },
                    error: function (res) {
                        layer.msg(res);
                    }
                });
            };

            window.updateInfo = function (res) {
                $.ajax({
                    url: "/teacher/getTeacherCourseById",
                    data: {"id": res},
                    type: "post",
                    dataType: "json",
                    success: function (response) {
                        if (response.success) {
                            $('#courseId').val(response.data.courseId);
                            $('#courseName').val(response.data.courseName);
                            $('#courseTypeName').val(response.data.courseType.name);
                            $('#courseCredit').val(response.data.courseCredit);
                            $('#courseCycle').val(response.data.courseCycle);
                            $('#courseGrade').val(response.data.courseGrade);
                            $('#remarks').val(response.data.remarks);
                            layer.open({
                                type: 1,
                                title: "编辑专业",
                                area: ['600px', '500px'],
                                content: $("#InfoUpdate"),
                                btn: ['确认', '取消'],
                                yes: function (index, layero) {
                                    var courseId = $('#courseId').val();
                                    var courseName = $('#courseName').val();
                                    var courseCredit = $('#courseCredit').val();
                                    var courseCycle = $('#courseCycle').val();
                                    var remarks = $('#remarks').val();
                                    $.ajax({
                                        type: "POST",
                                        url: "/teacher/updateTeacherCourse",
                                        data: {
                                            'id': courseId,
                                            'courseName': courseName,
                                            'courseCredit': courseCredit,
                                            'courseCycle': courseCycle,
                                            'remarks': remarks
                                        },
                                        dataType: 'json',
                                        success: function (res) {
                                            if (res.success) {
                                                layer.msg("更新成功", {offset: '60px', icon: 6, anim: 6, time: 1000});
                                                layer.close(index);
                                                location.reload();
                                            } else {
                                                layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                                            }
                                        },
                                        error: function (res) {
                                            layer.msg(res);
                                        }
                                    });
                                },
                                btn2: function (index, layero) {
                                    layer.close(index);
                                }
                            });
                        } else {
                            layer.msg(response.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                        }
                    },
                    error: function (res) {
                        console.info(res);
                    }
                });
            }


            //监听提交
            form.on('submit(teacherCourseForm)', function (data) {
                $.ajax({
                    type: "post",
                    dataType: 'json',
                    contentType: "application/json;charset=UTF-8",
                    url: "/teacher/save",
                    data: JSON.stringify(data.field),
                    success: function (res) {
                        if (res.success) {
                            layer.msg("新增成功", {offset: '60px', icon: 6, anim: 6, time: 1000});
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
        }
    )


</script>

</body>
</html>