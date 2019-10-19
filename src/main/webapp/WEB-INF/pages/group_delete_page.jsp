<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Group list to delete</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    </head>
    <body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
                <ul id="groupList" class="nav navbar-nav">
                    <li><button type="button" id="delete_group" class="btn btn-default navbar-btn">Delete Group</button></li>
                </ul>
        </div>
    </nav>
        <table class="table table-striped">
        <thead>
        <tr>
            <td><b>Group list</b></td>
        </tr>
        </thead>
        <c:forEach items="${groups}" var="group">
            <tr>
                <td><input type="checkbox" name="toDelete[]" value="${group.id}" id="checkbox_${group.name}"/></td>
               <td>${group.name}</td>
            </tr>
        </c:forEach>
        </table>
        <script>
            $('#delete_group').click(function(){
                var data = { 'toDelete[]' : []};
                $(":checked").each(function() {
                    data['toDelete[]'].push($(this).val());
                });
                $.post("/group/delete", data, function(data, status) {
                    window.location.reload();
                });
            });
        </script>
    </body>
</html>