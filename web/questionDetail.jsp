<%-- 
    Document   : questionDetail
    Created on : Feb 20, 2021, 12:58:31 PM
    Author     : ACER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Detail Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <style>
            h1{
                margin-top: 20px;
            }
            #question{
                color: navy;
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
                        <h1 style="text-align: center">Welcome ${sessionScope.USER.name}</h1>
                        <h1 style="text-align: center">Question Detail</h1>
                        <c:if test="${requestScope.QUESTION!=null}">
                            <c:set var="q" scope="page" value="${requestScope.QUESTION}"></c:set>
                                <form action="edit">
                                    <h2 id="question">QuestionID: ${q.questionID}</h2><br>
                                <input type="hidden" value="${q.questionID}" name="questionID">
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Question content:</span>
                                    </div>
                                    <input type="text" name="question" class="form-control" value="${q.questionContent}" placeholder="Question content"  aria-describedby="basic-addon1">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Anwser 1:</span>
                                    </div>
                                    <input type="text" name="anwser1" class="form-control" placeholder="Anwser 1:" value="${q.anwser1}" aria-describedby="basic-addon1">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Anwser 2:</span>
                                    </div>
                                    <input type="text" name="anwser2" class="form-control" placeholder="Anwser 2:"  value="${q.anwser2}" aria-describedby="basic-addon1">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Anwser 3:</span>
                                    </div>
                                    <input type="text" name="anwser3" class="form-control" placeholder="Anwser 3:" value="${q.anwser3}" aria-describedby="basic-addon1">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Anwser 4:</span>
                                    </div>
                                    <input type="text" name="anwser4" class="form-control" placeholder="Anwser 4:" value="${q.anwser4}"  aria-describedby="basic-addon1">
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="basic-addon1">Correct anwser:</span>
                                    </div>
                                    <input type="text" name="correct"  class="form-control" placeholder="Anwser 4:" value="${q.anwserCorrect}"  aria-describedby="basic-addon1">
                                </div>

                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputGroupSelect01">Subject:</label>
                                    </div>
                                    <select class="custom-select" id="inputGroupSelect01" name="status">                                      
                                        <c:forEach var="st" items="${requestScope.STATUS}">
                                            <c:choose>
                                                <c:when test="${st == q.status }">
                                                    <option selected="" value="${st}">${st}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${st}">${st}</option>
                                                </c:otherwise>
                                            </c:choose>                                       
                                        </c:forEach>                                  
                                    </select> 
                                </div>
                                <div class="input-group mb-3">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="inputGroupSelect01">Subject:</label>
                                    </div>
                                    <select class="custom-select" id="inputGroupSelect01" name="subjectID">                                      
                                        <c:forEach var="sub" items="${requestScope.SUBJECT}">
                                            <c:choose>
                                                <c:when test="${sub eq q.subjectID }">
                                                    <option selected="" value="${sub}">${sub}</option>
                                                </c:when>
                                                <c:otherwise>
                                                    <option value="${sub}">${sub}</option>
                                                </c:otherwise>
                                            </c:choose>                                       
                                        </c:forEach>                                  
                                    </select>
                                </div>
                                <input type="submit" class="btn btn-primary btn-lg btn-block" name="btnAction" value="Update">
                                <input type="submit" class="btn btn-secondary btn-lg btn-block" name="btnAction" value="Delete">
                            </form>
                        </c:if>
                        <h2 style="color: blueviolet">${requestScope.STATUS_EDIT}</h2>

                        <a class="badge badge-pill badge-warning" href="AdminController?">Back to list</a>
                    </c:otherwise>
                </c:choose>
            </c:otherwise>
        </c:choose>
    </body>
</html>
