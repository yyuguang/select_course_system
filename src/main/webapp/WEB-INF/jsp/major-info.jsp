<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/global.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>湖北工程学院选课管理系统 - 专业管理</title>
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
                        <a class="layui-btn layui-btn-small layui-btn-normal" id="addMajor"><i
                                class="layui-icon">&#xe654;</i></a>
                    </div>
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
                        <col width="50">
                        <col class="hidden-xs" width="200">
                        <col class="hidden-xs" width="300">
                        <col class="hidden-xs" width="300">
                        <col class="hidden-xs" width="250">
                        <col width="150">
                    </colgroup>
                    <thead>
                    <tr>
                        <th></th>
                        <th class="hidden-xs">ID</th>
                        <th>专业名称</th>
                        <th>所属院系</th>
                        <th class="hidden-xs">创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${majorList}" var="major" varStatus="index">
                        <tr>
                            <td></td>
                            <td class="hidden-xs">${index.index +1}</td>
                            <td>${major.name}</td>
                            <td>${major.college.name}</td>
                            <td class="hidden-xs">
                                <fmt:formatDate value="${major.createTime}" pattern="yyyy年MM月dd日"/>
                            </td>
                            <td>
                                <a class="layui-btn layui-btn-small layui-btn-normal" data-id="1"
                                   onclick="updateMajor('${major.id}');"><i
                                        class="layui-icon">&#xe642;</i></a>
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
        <form class="layui-form" action="">
            <div class="layui-form-item" style="margin-top: 50px">
                <label class="layui-form-label">院系名称</label>
                <div class="layui-input-block">
                    <select name="college" id="createCollege" class="layui-select" style="max-height: 150px">
                        <c:forEach items="${collegeList}" varStatus="col" var="college">
                            <option value="${college.id}">${college.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">专业名称</label>
                <div class="layui-input-block">
                    <input type="text" name="name" id="createName" required
                           lay-verify="required" autofocus autocomplete="off" class="layui-input">
                </div>
            </div>
        </form>
    </div>
</div>

<div class="layui-row" id="InfoUpdate" style="display: none;">
    <div class="layui-col-md10">
        <form class="layui-form" action="">
            <div class="layui-form-item" style="margin-top: 50px">
                <label class="layui-form-label">院系名称</label>
                <div class="layui-input-block">
                    <input id="collegeName" type="text" name="collegeName" readonly
                           lay-verify="required" value="" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">专业名称</label>
                <div class="layui-input-block">
                    <input id="name" type="text" name="updateMajorName" required value=""
                           lay-verify="required" autofocus autocomplete="off" class="layui-input">
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

        $("#addMajor").on("click", function () {
            layer.open({
                type: 1,
                title: "新增院系",
                area: ['600px', '400px'],
                content: $("#InfoCreate"),
                btn: ['确认', '取消'],
                yes: function (index, layero) {
                    form.render('select');
                    var name = $("#createName").val();
                    var college = $("#createCollege").val();
                    $.ajax({
                        type: "POST",
                        url: "/major/save",
                        data: {
                            'name': name,
                            'college.id': college
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
                    layer.close(index);
                }
            });

        });
    
        window.updateMajor = function (res) {
            $.ajax({
                url: "/major/getMajor",
                data: {"id": res},
                type: "get",
                dataType: "json",
                success: function (response) {
                    if (response.success) {
                        $('#collegeName').val(response.data.college.name);
                        $('#name').val(response.data.name);
                        layer.open({
                            type: 1,
                            title: "编辑专业",
                            area: ['600px', '300px'],
                            content: $("#InfoUpdate"),
                            btn: ['确认', '取消'],
                            yes: function (index, layero) {
                                var name = $("#name").val();
                                $.ajax({
                                    type: "POST",
                                    url: "/major/updateMajor",
                                    data: {
                                        'name': name,
                                        'id': res
                                    },
                                    dataType: 'json',
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
                    console.info(res);
                }
            });

        };

        /**
         * 筛选专业
         */
        window.findAllByCollegeId = function () {
            var collegeId = $('#collegeId').val();
            if(collegeId == null || collegeId ==''){
                layer.msg('请选择院系', {offset: '60px', icon: 5, anim: 6, time: 3000});
                return;
            }

            $.ajax({
                type: "get",
                dataType: "json",
                url: "/major/listMajor",
                data: {
                    'collegeId': collegeId
                },
                success: function (res) {
                    layer.msg("查询成功", {offset: '60px', icon: 6, anim: 6, time: 1000});
                },
                error: function (res) {
                    layer.alert(res);
                }
            });

        }
    })


</script>

</body>

</html>