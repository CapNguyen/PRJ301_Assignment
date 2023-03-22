<%-- 
    Document   : StudentInfo
    Created on : Mar 17, 2023, 11:58:27 PM
    Author     : admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Student Info</title>
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
                         <a href="../timetable">
                              <h3><strong>Timetable</strong></h3>
                         </a>
                         <h3><strong>| User detail</strong></h3>               
                    </div>
                    <div class="col-md-6" style="margin-left: 600px">
                         <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                              <button>
                                   <a href="">${s.account.accountName}</a>
                              </button>
                         </c:forEach>
                         |
                         <button>
                              <a href="/logout">Logout</a>
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
                         <h2>User detail</h2>
                         <a href="../AC">Course attendance</a>
                    </div>
                    <table class="infotable" style="margin-top: 10px">
                         <tbody>
                              <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">
                                   <tr>
                                        <td class="infocell"><b>Login</b></td>
                                        <td class="infocell">${s.account.accountName}</td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Full name</b></td>
                                        <td class="infocell">${s.name}</td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Image</b></td>
                                        <td class="infocell"> <img style="height: 150px; width: 120px" src="${pageContext.request.contextPath}/img/avatar.png" alt="avatar"/></td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Email</b></td>
                                        <td class="infocell">${s.email}</td>
                                   </tr>
                              </c:forEach>
                         </tbody>
                    </table>
               </div>
          </div>
     </body>
</html>
