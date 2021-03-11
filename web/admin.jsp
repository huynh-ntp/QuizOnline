<%-- 
    Document   : admin
    Created on : Jan 29, 2021, 8:24:02 AM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style>
            body{
                background: linear-gradient(0.25turn, #3f87a6, #ebf8e1, #f69d3c);
            }
            .paging{
                text-align: center;
                margin-bottom: 30px;
                margin-top: 10px;

            }
            
            #create{
                margin-top: 30px;
                margin-bottom: 30px;
            }
            
            h1{
                text-align: center;
                margin-top: 20px;
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
                    <c:when test="${sessionScope.USER.roleID eq 'ST'}">
                        <c:redirect url="login.jsp"></c:redirect>
                    </c:when>
                    <c:otherwise>
                        <h1>Welcome ${sessionScope.USER.name}</h1>
                        
                        <form action="searchAdmin">
                            
                        </form>
                        
                        <form action="gotoCreate">
                            <input class="btn btn-primary" id="create" type="submit" name="btnAction" value="Create New">
                            <a class="btn btn-danger" href="LogoutController">Logout</a>   
                        </form>
                        
                        
                            <c:if test="${requestScope.LIST!=null}">
                                <table class="table table-borderless">
                                    <thead>
                                        <tr>
                                            <th scope="col">QuestionID</th>
                                            <th scope="col">Question content</th>
                                            <th scope="col">Create date</th>
                                            <th scope="col">Subject</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Detail</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="q" items="${requestScope.LIST}">
                                        <form action="detail">
                                            <tr>
                                                <td>${q.questionID}</td>
                                                <td>${q.questionContent}</td>
                                                <td>${q.createDate}</td>
                                                <td>${q.subjectID}</td>
                                                <td>${q.status}</td>
                                                <td>
                                                    <input  type="hidden" name="questionID" value="${q.questionID}">
                                                    <input class="btn btn-info" type="submit" value="View">
                                                </td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="paging">     
                                    
                                    <c:forEach var="p" begin="1" end="${requestScope.TOTAL_PAGE}">
                                        
                                        <a class="btn btn-danger" href="AdminController?curPage=${p}">${p}</a>
                                    </c:forEach>
                                </div>
                            </c:if>
                     
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </body>
</html>
