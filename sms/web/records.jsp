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
            List<Student> studentList = (List<Student>) session.getAttribute("studentList");
        %>
        <div class="container">
            <h1>List of registered students</h1>
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
                    <c:forEach var="h" items="${studentList}" varStatus="status">
                        <tr>
                            <td>${h.id}</td>
                            <td>${h.firstName}</td>
                            <td>${h.lastName}</td>
                            <td>${h.gender}</td>
                            <td>${h.dob}</td>
                            <td>${h.faculty}</td>
                            <td>${h.department}</td>
                            <td> <a href="#"><span class="glyphicon glyphicon-edit"></span></a></td>
                            <td><a href="#"><span class="glyphicon glyphicon-trash"></span></a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>