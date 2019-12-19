<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/global.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>湖北工程学院 - 选课管理系统</title>
    <link rel="stylesheet" href="${path}/static/js/layui/css/layui.css">
    <link rel="stylesheet" href="${path}/static/css/index.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header layui-bg-cyan">
        <div class="layui-logo title">
            <a href="" style="color: #009688;">湖北工程学院 - 选课管理系统</a>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${LOGIN_USER.stuImg}" class="layui-nav-img">
                    ${LOGIN_USER.stuName}
                </a>
            </li>
            <li class="layui-nav-item"><a href="${path}/login/logout">退出</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-cyan">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree layui-bg-cyan">
                <c:if test="${LOGIN_USER.role == 1}">
                    <li class="layui-nav-item">
                        <a class="" href="javascript:;"><i class="layui-icon layui-icon-user"></i>&nbsp;&nbsp;学生管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="${path}/student/studentInfo" target="myIframe"><i
                                    class="layui-icon layui-icon-add-1"></i>&nbsp;&nbsp;个人信息</a>
                            </dd>
                            <dd><a href="${path}/studentCourse/listStudentCourse" target="myIframe"><i
                                    class="layui-icon layui-icon-add-1"></i>&nbsp;&nbsp;课程管理</a></dd>
                        </dl>
                    </li>
                </c:if>
                <c:if test="${LOGIN_USER.role == 2}">
                    <li class="layui-nav-item">
                        <a href="javascript:;"><i class="layui-icon layui-icon-group"></i>&nbsp;&nbsp;教师管理</a>
                        <dl class="layui-nav-child">
                            <dd><a href="${path}/student/studentInfo" target="myIframe"><i
                                    class="layui-icon layui-icon-add-1"></i>&nbsp;&nbsp;个人信息</a>
                            </dd>
                            <dd><a href="${path}/teacher/listTeacherCourse" target="myIframe"><i
                                    class="layui-icon layui-icon-add-1"></i>&nbsp;&nbsp;课程管理</a></dd>
                        </dl>
                    </li>
                </c:if>
                <c:if test="${LOGIN_USER.role == 0}">
                    <li class="layui-nav-item"><a href="javascript:;"><i
                            class="layui-icon layui-icon-read"></i>&nbsp;&nbsp;组织机构</a>
                        <dl class="layui-nav-child">
                            <dd><a href="${path}/college/listCollege" target="myIframe"><i
                                    class="layui-icon layui-icon-add-1"></i>&nbsp;&nbsp;院系管理</a></dd>
                            <dd><a href="${path}/major/listMajor" target="myIframe"><i
                                    class="layui-icon layui-icon-add-1"></i>&nbsp;&nbsp;专业管理</a></dd>
                            <dd><a href="${path}/grade/listGrade" target="myIframe"><i
                                    class="layui-icon layui-icon-add-1"></i>&nbsp;&nbsp;班级管理</a></dd>
                            <dd><a href="${path}/courseType/listCourseType" target="myIframe"><i
                                    class="layui-icon layui-icon-add-1"></i>&nbsp;&nbsp;课程分类</a></dd>
                        </dl>
                    </li>

                    <li class="layui-nav-item"><a href="javascript:;"><i
                            class="layui-icon layui-icon-set-fill"></i>&nbsp;&nbsp;管理员</a>
                        <dl class="layui-nav-child">
                            <dd><a href="${path}/admin/getAllStudents" target="myIframe"><i
                                    class="layui-icon layui-icon-add-1"></i>&nbsp;&nbsp;学生管理</a>
                            </dd>
                            <dd><a href="${path}/admin/getAllTeachers" target="myIframe"><i
                                    class="layui-icon layui-icon-add-1"></i>&nbsp;&nbsp;教师管理</a>
                            </dd>
                            <dd><a href="${path}/admin/getAllCourses" target="myIframe"><i
                                    class="layui-icon layui-icon-add-1"></i>&nbsp;&nbsp;课程管理</a>
                            </dd>
                        </dl>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <iframe src="${path}/welcome.jsp" width="100%" height="100%" name="myIframe" scrolling="auto" class="iframe"
                framborder="0"></iframe>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        Copyright 2019-2020 by LNZZ
    </div>
</div>
<script src="../../static/js/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function () {
        var element = layui.element;

    });
</script>
</body>
</html>