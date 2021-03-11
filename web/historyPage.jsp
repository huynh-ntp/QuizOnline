<%-- 
    Document   : historyPage
    Created on : Feb 17, 2021, 11:25:38 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            body{
                background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
            }
            h1{
                text-align: center;
                margin-top: 20px;
                margin-bottom: 20px;
            }
            .back{
                margin-bottom: 30px;
            }
            .paging{
                margin-top: 40px;
                margin-bottom: 20px;
                text-align:  center;
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
                        <h1>Welcome ${sessionScope.USER.name}</h1>


                        <div class="back">
                            <a class="btn btn-danger" href="LogoutController">Logout</a>
                            <a class="btn btn-danger" href="dashboard.jsp   ">Back to dashboard</a>   
                        </div>


                        <c:if test="${requestScope.HISTORY_LIST!=null}">
                            <table class="table table-borderless">
                                <thead>
                                    <tr>
                                        <th scope="col">Tests</th>
                                        <th scope="col">Mark</th>
                                        <th scope="col">Time</th>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="h" items="${requestScope.HISTORY_LIST}">
                                    <form action="detail">
                                        <tr>
                                            <td>${h.testsID}</td>
                                            <td>${h.mark}</td>
                                            <td>${h.time}</td>                                               
                                        </tr>
                                    </form>
                                </c:forEach>
                            </tbody>
                        </table>
                        <div class="paging">     
                            <c:forEach var="p" begin="1" end="${requestScope.TOTAL_PAGE}">
                                <a class="btn btn-danger" href="HistoryController?curPage=${p}">${p}</a>
                            </c:forEach>
                        </div>





                    </c:if>




































                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>


</body>
</html>