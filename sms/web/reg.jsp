<%-- 
    Document   : reg
    Created on : Oct 1, 2017, 1:54:01 PM
    Author     : kukut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Bootstrap Example</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script
            src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
            integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        -->
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
                        <input type="text" class="form-control" id="id" placeholder="Student Id" name="id" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="firstName">First Name:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="firstName" placeholder="Enter First Name" name="firstName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="lastName">Last Name:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="lastName" placeholder="Enter Last Name" name="lastName">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2">Gender:</label>
                    <label class="radio-inline">
                        <input type="radio" value="M" name="gender">Male
                    </label>
                    <label class="radio-inline">
                        <input type="radio" value="F" name="gender">Female
                    </label>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="dob">DOB:</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="dob" placeholder="Select DOB" name="dob">
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
                        <button type="reset" class="btn btn-danger">Reset</button>
                        <button type="submit" class="btn btn-default">Submit</button>
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

                    var selectedIndex = $(this).prop('selectedIndex');
                    //alert(selectedIndex);
                    $("#department").empty();
                    if (selectedIndex === 0) {
                        $("#department").append("<option value=''>No faculty selected</option>");
                    }
                    else if (selectedIndex === 1) {
                        $("#department").append("<option value=''>Select department</option>");
                        $("#department").append("<option value='Biochemistry'>Biochemistry</option>");
                        $("#department").append("<option value='Biology'>Biology</option>");
                        $("#department").append("<option value='Computer Science'>Computer Science</option>");

                    } else if (selectedIndex === 2) {

                        $("#department").append("<option value=''>Select department</option>");
                        $("#department").append("<option value='Electrical'>Electrical</option>");
                        $("#department").append("<option value='Petroleum'>Petroleum</option>");
                        $("#department").append("<option value='Mechanical'>Mechanical</option>");
                    } else {

                        $("#department").append("<option value=''>Select department</option>");
                        $("#department").append("<option value='Law'>Law</option>");
                        $("#department").append("<option value='Mass Communication'>Mass Communication</option>");
                        $("#department").append("<option value='Theatre'>Theatre</option>");
                    }
                });

            });

        </script>
    </body>
</html> 