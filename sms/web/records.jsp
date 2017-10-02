<%-- 
    Document   : records
    Created on : Oct 1, 2017, 5:11:29 PM
    Author     : kukut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List" %>
<%@page import="com.techdroit.model.Student" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Record</title>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/jquery-ui/external/jquery/jquery.js" type="text/javascript"></script>
        <script src="resources/jquery-ui/jquery-ui.js" type="text/javascript"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="resources/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="template.jsp" />
        <%
            List<Student> stdList = (List<Student>) session.getAttribute("stdList");
            String userName = (String) session.getAttribute("userName");
        %>
        <div class="container">
            <h1>List of registered students</h1>
            <%--<h3>Welcome ${userName}</h3>--%>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Gender</th>
                        <th>DOB</th>
                        <th>Faculty</th>
                        <th>Department</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="student" items="${stdList}" varStatus="status">
                        <tr>
                            <td id="recId">${student.id}</td>
                            <td>${student.firstName}</td>
                            <td>${student.lastName}</td>
                            <td>${student.gender}</td>
                            <td>${student.dob}</td>
                            <td>${student.faculty}</td>
                            <td>${student.department}</td>
                            <td> <a href="EditServlet?id=${student.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                            <td><a data-toggle="modal" data-target="#myModal${status.count}"><span class="glyphicon glyphicon-trash"></span></a></td>
                                    <%--
                                    <td><a href="DeleteServlet?id=${student.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                                    --%>
                            <!-- Modal -->
                    <div class="modal fade" id="myModal${status.count}" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 class="modal-title">Delete Student Record</h4>
                                </div>
                                <div class="modal-body">
                                    <p>Do you want to delete record id ${student.id}</p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <a class="btn btn-danger" href="DeleteServlet?id=${student.id}">Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>