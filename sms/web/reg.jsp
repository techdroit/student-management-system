<%-- 
    Document   : reg
    Created on : Oct 1, 2017, 1:54:01 PM
    Author     : kukut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.techdroit.model.Student" %>
<%
    Student std = (Student) session.getAttribute("std");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/jquery-ui/external/jquery/jquery.js" type="text/javascript"></script>
        <script src="resources/jquery-ui/jquery-ui.js" type="text/javascript"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="resources/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="template.jsp" />

        <div class="container">
            <h2>Student Management System</h2>
            <form class="form-horizontal" action="RegServlet" method="POST">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="id">Student Id:</label>
                    <div class="col-sm-4">
                        <input type="text" value="${std.id}" class="form-control" id="id" placeholder="Student Id" name="id" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="firstName">First Name:</label>
                    <div class="col-sm-4">
                        <input type="text" value="${std.firstName}" class="form-control" id="firstName" placeholder="Enter First Name" name="firstName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="lastName">Last Name:</label>
                    <div class="col-sm-4">
                        <input type="text" value="${std.lastName}" class="form-control" id="lastName" placeholder="Enter Last Name" name="lastName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Gender:</label>
                    <label class="radio-inline">
                        <input type="radio" value="M" name="gender" <c:if test="${std.gender == 'M'}">checked</c:if>>Male
                    </label>
                    <label class="radio-inline">
                        <input type="radio" value="F" name="gender" <c:if test="${std.gender == 'F'}">checked</c:if>>Female
                    </label>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="dob">DOB:</label>
                    <div class="col-sm-4">
                        <input type="text" value="${std.dob}" class="form-control" id="dob" placeholder="Select DOB" name="dob">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="faculty">Faculty:</label>
                    <div class=" col-sm-4">
                        <select class="form-control" id="faculty" name="faculty">
                            <option value="">Select faculty</option>
                            <option value="Science">Science</option>
                            <option value="Engineering">Engineering</option>
                            <option value="Art">Art</option>
                        </select>
                    </div>

                </div> 
                <div class="form-group">
                    <label class="control-label col-sm-2" for="department">Department:</label>
                    <div class="col-sm-4">
                        <select class="form-control" id="department" name="department">
                            <option value="">Select department</option>
                            <option value="Biochemistry">Biochemistry</option>
                            <option value="Biology">Biology</option>
                            <option value="Computer Science">Computer Science</option>
                        </select>
                    </div>

                </div> 
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-4">
                        <c:if test="${not empty std}">
                            <button type="submit" name="btn" value="update" class="btn btn-success">Update</button>
                        </c:if>
                        <c:if test="${empty std}">
                            <button type="reset" class="btn btn-danger">Reset</button>
                            <button type="submit" name="btn" value="new" class="btn btn-default">Submit</button>
                        </c:if>
                        
                    </div>
                </div>
            </form>
        </div>
        <!--
        <script src="resources/jquery/jquery-1.12.1.js" type="text/javascript"></script>
        -->
        <script>
            $(function () {
                $("#dob").datepicker({
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: 'yy-m-dd',
                    yearRange: "1900:2020"
                });
            });

            $(document).ready(function () {

                $("#faculty").change(function () {
                    reLoadDropDown();
                });

                $("#faculty").val("${std.faculty}");
                reLoadDropDown();
                $("#department").val("${std.department}");

            });

            function reLoadDropDown() {
                var selectedIndex = $("#faculty").prop('selectedIndex');
                //alert(selectedIndex);
                if (selectedIndex === 0) {
                    $("#department").append("<option value=''>No faculty selected</option>");
                }
                else if (selectedIndex === 1) {

                    loadScienceDepartments();

                } else if (selectedIndex === 2) {

                    loadEngineeringDepartment();

                } else {

                    loadArtsDepartment();
                }
            }

            function loadScienceDepartments() {
                $("#department").empty();
                $("#department").append("<option value=''>Select department</option>");
                $("#department").append("<option value='Biochemistry'>Biochemistry</option>");
                $("#department").append("<option value='Biology'>Biology</option>");
                $("#department").append("<option value='Computer Science'>Computer Science</option>");
            }

            function loadEngineeringDepartment() {
                $("#department").empty();
                $("#department").append("<option value=''>Select department</option>");
                $("#department").append("<option value='Electrical'>Electrical</option>");
                $("#department").append("<option value='Petroleum'>Petroleum</option>");
                $("#department").append("<option value='Mechanical'>Mechanical</option>");
            }
            function loadArtsDepartment() {
                $("#department").empty();
                $("#department").append("<option value=''>Select department</option>");
                $("#department").append("<option value='Law'>Law</option>");
                $("#department").append("<option value='Mass Communication'>Mass Communication</option>");
                $("#department").append("<option value='Theatre'>Theatre</option>");
            }

        </script>
    </body>
    <%
        session.setAttribute("std",null);
    %>
</html> 