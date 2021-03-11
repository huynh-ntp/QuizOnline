<%-- 
    Document   : dashboard
    Created on : Jan 25, 2021, 1:42:44 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard Page</title>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
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

            .start_quiz {
                float: left;
                width: 600px;
                height: 450px;
                background: rgb(0, 0, 0);
                margin-top: 150px;
                margin-left: 670px;
                border-radius: 60px;
                border-style: outset;
                opacity: 0.5;
            }

            .start_quiz .choose {
                text-align: center;
                margin-top: 120px;
            }

            .start_quiz label {
                font-size: 50px;
                color: ivory;
                padding-right: 50px;
            }

            .start_quiz select {
                background-color: rgb(3, 31, 31);
                font-size: 50px;
                color: ivory;
                font-family: "Quicksand", sans-serif;
                border-radius: 25px;
                width: 350px;
                text-align-last: center;
            }

            .choose select option p {
                text-align: center;
            }

            .start_quiz #submit{
                font-family: "Quicksand", sans-serif;
                font-size: 50px;
                margin-top: 50px;
                border-radius: 20px;
                background-color: rgb(3, 31, 31);
                color: ivory;
            }

            .start_quiz #submit:hover{
                color: rgb(0, 221, 37);
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
                                <a href="">Quiz Online</a>
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
                        <div class="start_quiz">
                            <div class="choose">     
                                <form action="startQuiz">
                                    <label for="">Select:</label>
                                    <select name="testsID">
                                        <c:forEach var="testsID" items="${sessionScope.TESTS_LIST}" >
                                            <option value="${testsID}">${testsID}</option>
                                        </c:forEach>
                                    </select>
                                    <input id="submit" type="submit" value="Attempt Quiz">
                                </form>

                            </div>

                        </div>
                        <div class="body">
                        </div>
                        <div class="footer">

                        </div>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>

        <script>
            localStorage.clear();
        </script>

    </body>

</html>
