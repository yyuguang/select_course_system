<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/global.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>湖北工程学院选课管理系统 - 课程分类管理</title>
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
                    <a class="layui-btn layui-btn-small layui-btn-normal" id="addCourseType"><i
                            class="layui-icon">&#xe654;</i></a>
                </div>
            </form>
            <div class="layui-form" id="table-list">
                <table class="layui-table" lay-even lay-skin="nob">
                    <colgroup>
                        <col width="50">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="400">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="250">
                    </colgroup>
                    <thead>
                    <tr>
                        <th></th>
                        <th class="hidden-xs">编号</th>
                        <th>分类名称</th>
                        <th class="hidden-xs">创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${courseTypeList}" var="courseType" varStatus="id">
                        <tr>
                            <td></td>
                            <td class="hidden-xs">${id.index+1}</td>
                            <td>${courseType.name}</td>
                            <td class="hidden-xs">
                                <fmt:formatDate value="${courseType.createTime}" pattern="yyyy年MM月dd日"/>
                            </td>
                            <td>
                                <button class="layui-btn layui-btn-small layui-btn-normal"
                                        onclick="updateCourseType('${courseType.id}');"><i
                                        class="layui-icon">&#xe642;</i></button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="layui-row" id="InfoCreate" style="display: none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" method="post" id="saveForm">
            <div class="layui-form-item" style="margin-top: 50px">
                <label class="layui-form-label">课程分类</label>
                <div class="layui-input-block">
                    <input id="createName" type="text" name="name" required
                           lay-verify="required" autocomplete="off" autofocus class="layui-input">
                </div>
            </div>
        </form>
    </div>
</div>

<div class="layui-row" id="InfoUpdate" style="display: none;">
    <div class="layui-col-md10">
        <form class="layui-form layui-from-pane" action="">
            <div class="layui-form-item" style="margin-top: 50px">
                <label class="layui-form-label">课程分类</label>
                <div class="layui-input-block">
                    <input type="hidden" id="updateCourseTypeId" name="updateCourseTypeId" value="">
                    <input type="text" name="updateCourseTypeName" value="" required id="updateCourseTypeName"
                           lay-verify="required" autocomplete="off" autofocus class="layui-input">
                </div>
            </div>
        </form>
    </div>
</div>

<script src="${path}/static/js/layui/layui.js" type="text/javascript" charset="utf-8"></script>


<script>
    layui.use(['jquery', 'layer', 'table'], function () {
        var layer = layui.layer,
            table = layui.table,
            $ = layui.jquery;
        $("#addCourseType").on("click", function () {
            layer.open({
                type: 1,
                title: "新增院系",
                area: ['600px', '300px'],
                content: $("#InfoCreate"),
                btn: ['确认', '取消'],
                yes: function (index, layero) {
                    var name = $("#createName").val();
                    $.ajax({
                        type: "POST",
                        url: "/courseType/save",
                        data: {
                            'name': name
                        },
                        dataType: 'json',
                        success: function (res) {
                            if (res.success) {
                                layer.msg("新增成功", {offset: '60px', icon: 6, anim: 6, time: 1000});
                                layer.close(index);
                                location.reload();
                            } else {
                                console.log("错误信息是: " + res.msg);
                                layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                            }
                        },
                        error: function (res) {
                            layer.msg(res);
                        }
                    });
                },
                btn2: function (index, layero) {
                    $("#createName").val("");
                    layer.close(index);
                }
            });

        });


        window.updateCourseType = function (res) {
            $.ajax({
                url: "/courseType/getCourseType",
                data: {"id": res},
                type: "get",
                dataType: "json",
                success: function (response) {
                    if (response.success) {
                        $('#updateCourseTypeName').val(response.data.name);
                        $('#updateCourseTypeId').val(response.data.id);
                        layer.open({
                            type: 1,
                            title: "编辑院系",
                            area: ['600px', '300px'],
                            content: $("#InfoUpdate"),
                            btn: ['确认', '取消'],
                            yes: function (index, layero) {
                                var name = $("#updateCourseTypeName").val();
                                var id = $("#updateCourseTypeId").val();
                                $.ajax({
                                    type: "POST",
                                    dataType: "json",
                                    url: "/courseType/updateCourseType",
                                    data: {
                                        'name': name,
                                        'id': id
                                    },
                                    success: function (res) {
                                        if (res.success) {
                                            layer.msg("更新成功", {offset: '60px', icon: 6, anim: 6, time: 1000});
                                            layer.close(index);
                                            location.reload();
                                        } else {
                                            console.log("错误信息是: " + res.msg);
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
                        console.log("错误信息是: " + res.msg);
                        layer.msg(response.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                    }
                },
                error: function (res) {
                    layer.msg(res);
                }
            });


        }
    })


</script>


</body>

</html>