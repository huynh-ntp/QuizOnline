<%-- 
    Document   : createStatus
    Created on : Feb 18, 2021, 6:04:52 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Status Page</title>
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
         <style>
             body{
                 background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
             }
             h1{
                 text-align: center;
                 margin-top: 10px;
                 margin-bottom: 30px;
                 color: forestgreen;
                 
             }
         </style>
    </head>
    <body>
        <h1>Create success</h1>
        <form action="gotoCreate">
            <input class="btn btn-primary btn-lg btn-block" type="submit" value="Create New">
        </form>
        <a class="btn btn-secondary btn-lg btn-block" href="AdminController?">Goto list</a>
    </body>
</html>
