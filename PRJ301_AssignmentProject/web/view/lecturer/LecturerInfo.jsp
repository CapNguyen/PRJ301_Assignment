<%-- 
    Document   : LecInfo
    Created on : Mar 17, 2023, 11:51:41 PM
    Author     : admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Lecturer Info</title>
          <link href="${pageContext.request.contextPath}/css/jsp.css" rel="stylesheet" type="text/css"/>

     </head>
     <body>
          <div class="container" >
               <div class="row">
                    <div class="col-md-8">
                         <h1><span>FPT University Academic Portal</span></h1>
                    </div>
               </div>
               <div class="row" id="row2">
                    <div class="col-md-6" style="text-align: left; display: flex">
                         <c:if test="${requestScope.stu ne null}">
                              <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                                   <a class="aref"style="margin-left: 20px;" href="../timetable"><h3 class="h3ref"style="margin-top: 8px"><strong>Timetable</strong></h3></a>
                              </c:forEach>
                         </c:if>
                         <c:if test="${requestScope.lect ne null}">
                              <c:forEach items="${requestScope.lect}" var="l" varStatus="loop">          
                                   <a class="aref" href="../schedule"><h3 class="h3ref"><strong>Schedule</strong></h3>
                                   </a>
                              </c:forEach>
                         </c:if>
                         <h3 style="margin-top: 8px; margin-left: 20px"><strong>| Account detail</strong></h3>
                    </div>
                    <div class="col-md-6" style="margin-left: 600px">
                         <c:if test="${requestScope.stu ne null}">
                              <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                                   <button>
                                        <a href="../student/info">${s.account.accountName}</a>
                                   </button>
                              </c:forEach>
                         </c:if>
                         <c:if test="${requestScope.lect ne null}">
                              <c:forEach items="${requestScope.lect}" var="l" varStatus="loop">          
                                   <button>
                                        <a href="../lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
                                   </button>
                              </c:forEach>
                         </c:if>
                         |
                         <button>
                              <a href="logout">Logout</a>
                         </button>
                         |
                         <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                              <button>
                                   ${cs.name}
                              </button>
                         </c:forEach>
                    </div>
               </div>
               <div class="content">
                    <div>
                         <h2>Account detail</h2>
                    </div>
                    <table class="infotable">
                         <tbody>
                              <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">
                                   <tr>
                                        <td class="infocell"><b>Login</b></td>
                                        <td class="infocell">${l.account.accountName}</td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Full name</b></td>
                                        <td class="infocell">${l.name}</td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Image</b></td>
                                        <td class="infocell"><img style="height: 150px; width: 120px" src="${pageContext.request.contextPath}/img/images.jpg" alt="alt"/></td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Email</b></td>
                                        <td class="infocell">${l.email}</td>
                                   </tr>
                              </c:forEach>
                         </tbody>
                    </table>
               </div>
          </div>
     </body>
</html>

