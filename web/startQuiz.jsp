<%-- 
    Document   : quizAttempt
    Created on : Jan 31, 2021, 2:41:05 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quiz Attempt</title>

        <style>

            @import url('https://fonts.googleapis.com/css?family=Quicksand:400,500,700');
            body{
                background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
            }
            body {
                font-family: "Quicksand", sans-serif;
                padding: 0;
                margin: 0;
            }

            .nav {
                width: 100%;
                height: 100px;
                background-color: rgb(211, 22, 16);
            }

            .body {
                width: 100%;
                height: 900px;
                background-color: rgb(255, 255, 255);
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

            .quiz {
                height: 600px;
                width: 1000px;
                background-color: #3f87a6;
                margin-top: 50px;
                margin-left: 500px;
                border-radius: 50px;
                margin-bottom: 50px;
            }

            .quiz #question {
                float: left;
                width: 100%;
                margin-top: 30px;
                margin-left: 30px;
                margin-right: 30px;
            }

            .quiz #anwser {
                float: left;
                margin-top: 10px;
                font-size: 20px;
                margin-left: 40px;
            }

            .quiz #anwser input {
                margin-top: 50px;
            }

            .quiz #anwser input[type="radio"] {
                -ms-transform: scale(1.5);
                /* IE 9 */
                -webkit-transform: scale(1.5);
                /* Chrome, Safari, Opera */
                transform: scale(1.5);
            }

            #quiz-time-left {
                margin-top: 10px;
                text-align: center;
                width: 100%;
                font-size: 50px;
                color: rgb(173, 2, 179);
            }
            .button{             
                float: left;
                margin-top: 40px;
                margin-left: 370px;
            }
            
            .button [type=submit]{
                height: 40px;
                width: 70px;
            }
            .button button{
                font-size: 40px;
            }
            .button #pre {
                margin-left: -60px;
            }
            .button #next {
                margin-left: 30px;
            }
            .button #quiz{
                margin-left: 250px;
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
                                    <li><a href="">${sessionScope.USER.name}</a></li>
                                    <li><a href="">Portfolio</a></li>
                                    <li><a href="">Service</a></li>
                                    <li><a href="">Contact</a></li>
                                </ul>
                            </div>
                        </div>

                        <div id="quiz-time-left"> </div>

                        <div class="quiz">
                            <c:set var="questionNum" value="${requestScope.questionNum!=null?requestScope.questionNum:1}"></c:set>
                            <c:forEach var="question" varStatus="counter" items="${sessionScope.LIST_QUESTION}">
                                <c:if test="${counter.count==questionNum}">
                                    <form  action="nextQuestion">
                                        <h1 id="question">Q${questionNum}:${question.questionContent}</h1>
                                        <div id="anwser">
                                            <label>
                                                <c:choose>
                                                    <c:when test="${question.anwserChoice eq question.anwser1}">
                                                        <input type="radio" id="anwser1" name="anwser" checked="" onclick="checked1();" value="${question.anwser1}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="radio" id="anwser1" name="anwser" onclick="checked1();" value="${question.anwser1}">
                                                    </c:otherwise>
                                                </c:choose>
                                                <i>${question.anwser1}</i><br>
                                            </label>
                                            <label>
                                                <c:choose>
                                                    <c:when test="${question.anwserChoice eq question.anwser2}">
                                                        <input type="radio" id="anwser2" name="anwser" checked="" onclick="checked2();" value="${question.anwser2}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="radio" id="anwser2" name="anwser" onclick="checked2();" value="${question.anwser2}">
                                                    </c:otherwise>
                                                </c:choose>
                                                <i>${question.anwser2}</i><br>
                                            </label>
                                            <label>
                                                <c:choose>
                                                    <c:when test="${question.anwserChoice eq question.anwser3}">
                                                        <input type="radio" id="anwser3" name="anwser" checked="" onclick="checked3();" value="${question.anwser3}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="radio" id="anwser3" name="anwser" onclick="checked3();" value="${question.anwser3}">
                                                    </c:otherwise>
                                                </c:choose>
                                                <i>${question.anwser3}</i><br>
                                            </label>
                                            <label>
                                                <c:choose>
                                                    <c:when test="${question.anwserChoice eq question.anwser4}">
                                                        <input type="radio" id="anwser4" name="anwser" checked="" onclick="checked4();" value="${question.anwser4}">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="radio" id="anwser4" name="anwser" onclick="checked4();" value="${question.anwser4}">
                                                    </c:otherwise>
                                                </c:choose>
                                                <i>${question.anwser4}</i><br>  
                                            </label>
                                            <input type="hidden" id="finalAnwser" name="finalAnwser">
                                            <input type="hidden" name="questionNum" value="${questionNum}">
                                            <div class="button">                        
                                                <input type="submit" name="btnAction" value="<">
                                                <input type="submit" name="btnAction" value=">"> 
                                                <input id="quiz" type="submit" name="btnAction" value="Submit"> 
                                            </div>                           
                                        </div>

                                    </form>
                                </c:if>
                            </c:forEach>
                        </div>          
                        <script>
                            function checked1() {
                                var anwser = document.getElementById("anwser1").value;
                                document.getElementById("finalAnwser").value = anwser;
                            }

                            function checked2() {
                                var anwser = document.getElementById("anwser2").value;
                                document.getElementById("finalAnwser").value = anwser;
                            }

                            function checked3() {
                                var anwser = document.getElementById("anwser3").value;
                                document.getElementById("finalAnwser").value = anwser;
                            }

                            function checked4(choice) {
                                var anwser = document.getElementById("anwser4").value;
                                document.getElementById("finalAnwser").value = anwser;
                            }


                            if (localStorage.getItem("totalTime")) {
                                var total_seconds = localStorage.getItem("totalTime");
                            } else {
                                var total_seconds = ${sessionScope.TIME_TO_DO} * 60;
                            }
                            var minutes = parseInt(total_seconds / 60);
                            var seconds = parseInt(total_seconds % 60);
                            function countDownTimer() {
                                if (seconds < 10) {
                                    seconds = "0" + seconds;
                                }
                                if (minutes < 10) {
                                    minutes = "0" + minutes;
                                }
                                document.getElementById("quiz-time-left").innerHTML = "Time Left :" + minutes + ":" + seconds;
                                if (total_seconds <= 0) {
//                                    setTimeout("document.quiz.submit()", 1);
                                    localStorage.clear();
                                    document.getElementById('quiz').dispatchEvent(new MouseEvent("click"));

                                } else {
                                    total_seconds = total_seconds - 1;
                                    minutes = parseInt(total_seconds / 60);
                                    seconds = parseInt(total_seconds % 60);
                                    localStorage.setItem("totalTime", total_seconds)
                                    setTimeout("countDownTimer()", 1000);
                                }
                            }
                            setTimeout("countDownTimer()", 1000);

                        </script>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>










    </body>

</html>
