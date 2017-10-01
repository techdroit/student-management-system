<%-- 
    Document   : sucess
    Created on : Oct 1, 2017, 4:20:22 PM
    Author     : kukut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success</title>
        <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="resources/jquery-ui/external/jquery/jquery.js" type="text/javascript"></script>
        <script src="resources/jquery-ui/jquery-ui.js" type="text/javascript"></script>
        <script src="resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="resources/jquery-ui/jquery-ui.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="template.jsp" />
        <div class="container">
            <div class="alert alert-success">
                <strong>Success!</strong> Student successfully registered.
            </div>
            <a href="reg.jsp" class="btn btn-default">Back</a>
        </div>
    </body>
</html>
