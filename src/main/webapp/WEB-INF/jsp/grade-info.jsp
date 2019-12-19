<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/commons/global.jsp" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>湖北工程学院选课管理系统 - 班级管理</title>
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
            <form class="layui-form">
                <div class="layui-form-item">
                    <div class="layui-inline">
                        <a class="layui-btn layui-btn-small layui-btn-normal" id="addGrade"><i
                                class="layui-icon">&#xe654;</i></a>
                    </div>
                    <div class="layui-inline">
                        <select id="selectCollegeId" lay-filter="selectCollegeId">
                            <option value="">请选择一个院系</option>
                            <c:forEach items="${collegeList}" var="college">
                                <option value="${college.id}">${college.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="layui-inline">
                        <select name="selectMajorId" id="selectMajorId">
                            <option value="">请选择一个专业</option>
                        </select>
                    </div>
                    <button class="layui-btn layui-btn-normal" onclick="findAllByMajorId();">搜索</button>
                </div>
            </form>
            <div class="layui-form" id="table-list">
                <table class="layui-table" lay-even lay-skin="nob">
                    <colgroup>
                        <col width="50">
                        <col class="hidden-xs" width="250">
                        <col class="hidden-xs" width="300">
                        <col class="hidden-xs" width="300">
                        <col class="hidden-xs" width="300">
                        <col class="hidden-xs" width="300">
                        <col class="hidden-xs" width="250">
                        <col width="150">
                    </colgroup>
                    <thead>
                    <tr>
                        <th></th>
                        <th class="hidden-xs">编号</th>
                        <th>班级名称</th>
                        <th>所属专业</th>
                        <th>所属院系</th>
                        <th>年级</th>
                        <th class="hidden-xs">创建时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${gradeList}" var="grade" varStatus="index">
                        <tr>
                            <td></td>
                            <td class="hidden-xs">${index.index + 1}</td>
                            <td>${grade.name}</td>
                            <td>${grade.major.name}</td>
                            <td>${grade.college.name}</td>
                            <td>${grade.classGrade}</td>
                            <td class="hidden-xs">
                                <fmt:formatDate value="${grade.createTime}" pattern="yyyy年MM月dd日"/>
                            </td>
                            <td>
                                <a class="layui-btn layui-btn-small layui-btn-normal" data-id="1" onclick="updateGrade('${grade.id}');"><i
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
                <label class="layui-form-label">所属院系</label>
                <div class="layui-input-block">
                    <select lay-filter="collegeId" id="collegeId">
                        <option value="">请选择院系</option>
                        <c:forEach items="${collegeList}" varStatus="col" var="college">
                            <option value="${college.id}">${college.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属专业</label>
                <div class="layui-input-block">
                    <select name="majorId" id="majorId" class="layui-select">
                        <option value="">请选择专业</option>
                    </select>
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属年级</label>
                <div class="layui-input-block">
                    <input type="text" name="classGrade" required id="classGrade"
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">班级名称</label>
                <div class="layui-input-block">
                    <input type="text" name="name" required id="name"
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </form>
    </div>
</div>

<div class="layui-row" id="InfoUpdate" style="display: none;">
    <div class="layui-col-md10">
        <form class="layui-form" action="">
            <div class="layui-form-item" style="margin-top: 50px">
                <label class="layui-form-label">所属院系</label>
                <div class="layui-input-block">
                    <input type="text" name="updateCollege" id="updateCollege" readonly required
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属专业</label>
                <div class="layui-input-block">
                    <input type="text" name="updateMajor" id="updateMajor" readonly required
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">所属年级</label>
                <div class="layui-input-block">
                    <input type="text" name="classGrade" id="updateClassGrade" required
                           lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-form-item">
                <label class="layui-form-label">班级名称</label>
                <div class="layui-input-block">
                    <input type="text" name="updateName" id="updateName" required
                           lay-verify="required" autocomplete="off" class="layui-input">
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


        $("#addGrade").on("click", function () {
            layer.open({
                type: 1,
                title: "新增院系",
                area: ['600px', '500px'],
                content: $("#InfoCreate"),
                btn: ['确认', '取消'],
                yes: function (index, layero) {
                    var college = $('#collegeId').val();
                    var majorId = $('#majorId').val();
                    var classGrade = $('#classGrade').val();
                    var name = $('#name').val();
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        url: "/grade/save",
                        data: {
                            'name': name,
                            'college.id': college,
                            'major.id': majorId,
                            'classGrade': classGrade,
                        },
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

        window.updateGrade = function(res){
            $.ajax({
                url: "/grade/getGrade",
                data: {"id": res},
                type: "get",
                dataType: "json",
                success: function (response) {
                    if (response.success) {
                        $('#updateCollege').val(response.data.college.name);
                        $('#updateMajor').val(response.data.major.name);
                        $('#updateName').val(response.data.name);
                        $("#updateClassGrade").val(response.data.classGrade);
                        layer.open({
                            type: 1,
                            title: "编辑院系",
                            area: ['600px', '500px'],
                            content: $("#InfoUpdate"),
                            btn: ['确认', '取消'],
                            yes: function (index, layero) {
                                var name = $("#updateName").val();
                                var classGrade = $("#updateClassGrade").val();
                                $.ajax({
                                    type: "POST",
                                    dataType: "json",
                                    url: "/grade/updateGrade",
                                    data: {
                                        'name': name,
                                        'classGrade': classGrade,
                                        'id': res
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


        form.on('select(collegeId)', function (data) {
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
                        $("#majorId").empty();
                        for (var i = 0; i < res.data.length; i++) {
                            $("#majorId").append("<option value='" + res.data[i].id + "'>" + res.data[i].name + "</option>");
                        }
                        form.render("select");
                    } else {
                        console.log("错误信息是: " + res.msg);
                        layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                    }
                },
                error: function (res) {
                    layer.msg(res);
                }
            });
        });

        form.on('select(selectCollegeId)', function (data) {
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
                        $("#selectMajorId").empty();
                        for (var i = 0; i < res.data.length; i++) {
                            $("#selectMajorId").append("<option value='" + res.data[i].id + "'>" + res.data[i].name + "</option>");
                        }
                        form.render("select");
                    } else {
                        console.log("错误信息是: " + res.msg);
                        layer.msg(res.msg, {offset: '60px', icon: 5, anim: 6, time: 3000});
                    }
                },
                error: function (res) {
                    layer.msg(res);
                }

            });


        });

        /**
         * 筛选专业
         */
        window.findAllByMajorId = function () {
            var majorId = $('#selectMajorId').val();
            if(majorId == null || majorId ==''){
                layer.msg('请选择专业', {offset: '60px', icon: 5, anim: 6, time: 3000});
                return;
            }
console.log(majorId);
            $.ajax({
                type: "get",
                dataType: "json",
                url: "/grade/listGrade",
                data: {
                    'majorId': majorId
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