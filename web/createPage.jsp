<%-- 
    Document   : createPage
    Created on : Feb 18, 2021, 4:55:59 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style>
            body{
                
            }
            h1{
                text-align: center;
                margin-top: 10px;
                margin-bottom: 10px;
            }
            h2{
                text-align: center;
                margin-bottom: 30px;
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
                        <h2>Create a new question</h2>
                        <form action="createNew">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="inputGroupSelect01">Subject:</label>
                                </div>
                                <select name="subject" class="custom-select" id="inputGroupSelect01">
                                    <c:if test="${requestScope.SUBJECT!=null}">
                                        <c:forEach var="s" items="${requestScope.SUBJECT}">
                                            <option value="${s}">${s}</option>
                                        </c:forEach>
                                    </c:if>
                                </select>
                            </div>
                           
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"  id="basic-addon1">Question content:</span>
                                </div>
                                <input type="text" name="question" required="" class="form-control" placeholder="Question content"  aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">Anwser 1:</span>
                                </div>
                                <input type="text" name="anwser1" required="" class="form-control" placeholder="Anwser 1:"  aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">Anwser 2:</span>
                                </div>
                                <input type="text" name="anwser2" required="" class="form-control" placeholder="Anwser 2:"  aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">Anwser 3:</span>
                                </div>
                                <input type="text" name="anwser3" required="" class="form-control" placeholder="Anwser 3:"  aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">Anwser 4:</span>
                                </div>
                                <input type="text" name="anwser4" required="" class="form-control" placeholder="Anwser 4:"  aria-describedby="basic-addon1">
                            </div>
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <span class="input-group-text" id="basic-addon1">Correct anwser:</span>
                                </div>
                                <input type="text" name="correct" required="" class="form-control" placeholder="Anwser 4:"  aria-describedby="basic-addon1">
                            </div>





                            <input class="btn btn-primary btn-lg btn-block" type="submit"  value="Create">  

                        </form>
                        <a class="badge badge-pill badge-warning"  href="AdminController?">Back to list</a>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </body>
</html>
