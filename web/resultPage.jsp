<%-- 
    Document   : resultPage
    Created on : Feb 17, 2021, 2:06:24 AM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>History Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style>
            @import url('https://fonts.googleapis.com/css?family=Quicksand:400,500,700');
            body {
                background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
                font-family: "Quicksand", sans-serif;
                padding: 0;
                margin: 0;
            }

            .nav {
                width: 100%;
                height: 100px;
                background-color: rgb(211, 29, 16);
            }

            .body {
                width: 100%;
                height: 900px;
                
            }

            .footer {
                width: 100%;
                height: 100px;
                background-color: rgba(221, 2, 2, 0.74);
            }

            .nav .logo a {
                float: left;
                text-decoration: none;
                padding: 25px;
                font-size: 40px;
                color: ivory;

            }

            .nav .logo a:hover {
                color: red;

            }

            .nav .list {
                float: right;
            }

            .nav .list ul {
                display: flex;
                list-style: none;

            }

            .nav .list ul li {
                padding-top: 10px;
            }

            .nav .list ul li a {
                text-decoration: none;
                font-size: 40px;
                color: ivory;
                margin-right: 50px;
            }

            .nav .list ul li a:hover {
                color: red;
            }

            .result{
                width: 1000px;
                height: 260px;
                background-color:#ebf8e1;
                margin-top: 100px;
                text-align: center;
                margin-left: 450px;
                float: left;
                border-radius: 50px;
            }

            .result h1{     
                width: 800px;
                height: 70px;
                font-size: 60px;
                margin-top: 10px;
                margin-left: 100px ;
                color: crimson;
            }
        </style>
    </head>
    <body>


        <c:choose>
            <c:when test="${sessionScope.USER ==null}">
                <c:redirect url="login.jsp"></c:redirect>
            </c:when>
            <c:otherwise>
                <c:choose>
                    <c:when test="${sessionScope.USER.roleID eq 'AD'}">
                        <c:redirect url="login.jsp"></c:redirect>
                    </c:when>
                    <c:otherwise>

                        <div class="nav">
                            <div class="logo">
                                <a href="">Your logo</a>
                            </div>
                            <div class="list">
                                <ul>
                                    <li><a href=""><button style='font-size:34px'>${USER.name} <i class='fas fa-address-card'></i></button> </a></li>
                                    <li><a href="http://localhost:8084/QuizOnline/history">History</a></li>
                                    <li><a href="">Contact</a></li>
                                    <li><a href="http://localhost:8084/QuizOnline/logout">Logout</a></li>
                                </ul>
                            </div>

                        </div>
                        <div class="result">
                            <h1>Quiz Result</h1>
                            <h2>Number of correct anwser:${requestScope.NUMOFCORRECT} / ${requestScope.MAXQUESTION}</h2>
                            <h2>Mark:${requestScope.MARK}</h2>
                            <a href="dashboard.jsp">Back to dashboard</a>
                        </div>

                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>


    </body>
</html>
