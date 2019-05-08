<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isELIgnored="false" %>
<html>
<head>
    <title>ssm</title>
    <%
        String a = request.getContextPath();
        request.setAttribute("APP_PATH", a);
    %>
    <link href="${APP_PATH}/bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="${APP_PATH}/js/jquery-3.3.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH}/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <script>
        $(function () {

            function getEmps(pageNum){
                $.ajax({url:"/emps",data:"pageNum="+pageNum, type:"GET", success:function (result) {

                        biaoge(result);
                        fenyeMsg(result);
                        fenyetiaoMsg(result);

                    }});
            }

            getEmps(1);

            function  biaoge(result) {
                $("tbody").text("");
                $.each(result.list, function (index, emp) {
                    var trNode = $("<tr></tr>");
                    var tdNode1 = $("<td></td>");
                    var tdNode2 = $("<td></td>");
                    var tdNode3 = $("<td></td>");
                    var tdNode4 = $("<td></td>");
                    var tdNode5 = $("<td></td>");
                    var tdNode6 = $("<td></td>");
                    var tdNode7 = $("<td></td>");
                    var tdNode8 = $("<td></td>");
                    var btnNode1 = $("<button></button>");
                    var btnNode2 = $("<button></button>");
                    btnNode1.attr("class", "btn btn-danger").text("删除");
                    btnNode2.attr("class", "btn btn-warning").text("修改");
                    tdNode1.text(emp.id);
                    tdNode2.text(emp.lastName);
                    tdNode3.text(emp.email);
                    tdNode4.text(emp.age);
                    tdNode5.text(emp.sex);
                    tdNode6.text(emp.birth);
                    tdNode7.text(emp.department.name);
                    tdNode8.append(btnNode1, " " ,btnNode2);
                    trNode.append(tdNode1).append(tdNode2).append(tdNode3)
                        .append(tdNode4).append(tdNode5).append(tdNode6)
                        .append(tdNode7).append(tdNode8).appendTo("tbody");
                });
                }

            function fenyeMsg(result) {
                var total = result.total;
                var pageNum = result.pageNum;
                var pageSize = result.pageSize;
                var pages = result.pages;
                var val = "当前页为第"+ pageNum +"页，共"+ pages +"页，每页"+ pageSize +"条数据，共"+ total +"条数据";
                $("#fenyeMsg").text(val);
            }

            function fenyetiaoMsg(result) {
                $("#pagesMsg").text("");
                var firstPageeNode = $("<li></li>");
                var aNode1 = $("<a></a>").text("首页");

                var prePageNode = $("<li></li>");
                var aNode2 = $("<a></a>").attr("aria-label", "Previous");
                var spanNode1 = $("<span></span>").attr("aria-hidden", "true").text("<<");
                aNode2.append(spanNode1);

                if (result.hasPreviousPage == false) {
                    firstPageeNode.attr("class", "disabled");
                    prePageNode.attr("class", "disabled");
                }
                firstPageeNode.click(function () {
                    getEmps(1);
                });
                prePageNode.click(function () {
                    getEmps(result.pageNum-1);
                });
                firstPageeNode.append(aNode1);
                prePageNode.append(aNode2);

                $("#pagesMsg").append(firstPageeNode, prePageNode);

                $.each(result.navigatepageNums, function (index, nnum) {
                    var numPageNode1 = $("<li></li>");
                    var anNode1 = $("<a></a>").text(nnum);
                    numPageNode1.append(anNode1);
                    if (nnum == result.pageNum) {
                        numPageNode1.attr("class", "active");
                    }
                    numPageNode1.click(function () {
                        getEmps(nnum);
                    });
                    $("#pagesMsg").append(numPageNode1);
                });

                var nextPageNode = $("<li></li>");
                var aNode3 = $("<a></a>").attr("aria-label", "Next");
                var spanNode2 = $("<span></span>").attr("aria-hidden", "true").text(">>");
                aNode3.append(spanNode2);


                var lastPageNode = $("<li></li>");
                var aNode4 = $("<a></a>").text("尾页");

                if (result.hasNextPage == false) {
                    nextPageNode.attr("class", "disabled");
                    lastPageNode.attr("class", "disabled");
                }
                nextPageNode.append(aNode3);
                lastPageNode.append(aNode4);
                nextPageNode.click(function () {
                    getEmps(result.pageNum+1);
                });
                lastPageNode.click(function () {
                    getEmps(result.pages);
                });

                $("#pagesMsg").append(nextPageNode, lastPageNode);
            }
        });
    </script>
</head>
<body>
    <!-- Modal模态框 -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Employee Add</h4>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-4"><h1>SSM Project</h1></div>
        </div>
        <div class="row">
            <div class="col-md-2 col-md-offset-10">
                <button class="btn btn-success" data-toggle="modal" data-target="#myModal">新增</button>
                <button class="btn btn-danger">批量删除</button>
            </div>
        </div>
        <div class="row">
            <table class="table table-hover">
                <thead>
                    <tr>
                       <th>ID</th>
                       <th>lastName</th>
                       <th>email</th>
                       <th>age</th>
                       <th>sex</th>
                       <th>birth</th>
                       <th>departmentName</th>
                       <th>操作</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
        <div class="row">
            <div class="col-md-4"><span id="fenyeMsg"></span></div>
            <div class="col-md-4 col-md-offset-4">
                <nav aria-label="Page navigation">
                    <ul class="pagination" id="pagesMsg">

                    </ul>
                </nav>
            </div>
        </div>
    </div>

</body>
</html>
