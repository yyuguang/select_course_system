<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/global.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>湖北工程学院选课管理系统 - 课程管理</title>
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
                        <select name="courseTypeId" id="courseTypeId" lay-filter="status">
                            <option value="">请选择一个课程类型</option>
                            <c:forEach items="${courseTypeList}" var="courseType">
                                <option value="${courseType.id}">${courseType.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button class="layui-btn layui-btn-normal">搜索</button>
                </div>
            </form>
            <div class="layui-form" id="table-list">
                <table class="layui-table" lay-even lay-skin="nob">
                    <colgroup>
                        <col width="50">
                        <col class="hidden-xs" width="100">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="200">
                    </colgroup>
                    <thead>
                    <tr>
                        <th></th>
                        <th class="hidden-xs">ID</th>
                        <th>课程名称</th>
                        <th>任课教师</th>
                        <th>课程类型</th>
                        <th>课程学分</th>
                        <th>课程学时</th>
                        <th>对应年级</th>
                        <th>开课时间</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${courseList}" var="course" varStatus="index">
                        <tr>
                            <th></th>
                            <th class="hidden-xs">${index.index + 1}</th>
                            <th>${course.courseName}</th>
                            <th>${course.courseTeacher.stuName}</th>
                            <th>${course.courseType.name}</th>
                            <th>${course.courseCredit}</th>
                            <th>${course.courseCycle}</th>
                            <th>${course.courseGrade}</th>
                            <th class="hidden-xs">
                                <fmt:formatDate value="${course.createTime}" pattern="yyyy年MM月dd日"/>
                            </th>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="${path}/static/js/layui/layui.js" type="text/javascript" charset="utf-8"></script>


<script>
    layui.use(['jquery', 'layer', 'form'], function () {
        var layer = layui.layer,
            form = layui.form,
            $ = layui.jquery;

    })


</script>

</body>

</html>