<%-- 
    Document   : registerStatus
    Created on : Feb 18, 2021, 2:57:09 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Status</title>
        <style>
            body{
                 background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
            }
            h1{
                text-align: center;
                
            }
        </style>
    </head>
    <body>
        <h1>${requestScope.STATUS}</h1>
        <a class="badge badge-pill badge-warning" href="login.jsp">Back to login</a>
    </body>
</html>
