<%-- 
    Document   : AttendanceTaking
    Created on : Mar 17, 2023, 11:57:53 PM
    Author     : admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Take Attendance</title>
          <link href="${pageContext.request.contextPath}/css/jsp.css" rel="stylesheet" type="text/css"/>
     </head>
     <body> 
          <div class="container">
               <div class="row">
                    <div class="col-md-8">
                         <h1><span>FPT University Academic Portal</span></h1>
                    </div>

               </div>
               <div class="row" id="row2">
                    <div class="col-md-6" style="text-align: left; display: flex">
                         <h3 ><strong>View Schedule</strong></h3>
                    </div>
                    <div class="col-md-6" style="margin-left: 800px">
                         <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">          
                              <button>
                                   <a href="lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
                              </button>
                         </c:forEach>
                         |
                         <button>
                              <a href="logout">Logout</a>
                         </button>

                    </div>
               </div>
               <div class="content">
                    <h1>Attendance Taking</h1>
                    <form action="AT" method="POST"> 
                         <table style="max-width: 85%">
                              <thead>
                                   <tr style="background-color: #6b90da;">
                                        <th style="width: 80px; text-align: left;">INDEX</th>
                                        <th style="width: 180px; text-align: left;">IMAGE</th>
                                        <th style="width: 100px; text-align: left;">CODE</th>
                                        <th style="width: 200px; text-align: left;">FULL NAME</th>
                                        <th style="width: 200px; text-align: left;">ATTENDANCE STATUS</td>
                                        <th style="width: 200px; text-align: left;">LECTURER'S COMMENT</td>
                                   </tr>
                              </thead>
                              <tbody>

                                   <c:forEach items="${requestScope.atts}" var="a" varStatus="loop">
                                        <tr>
                                             <td class="tdHeading"><strong>${loop.index +1}</strong></td>
                                             <td class="infocell"><img src="${pageContext.request.contextPath}/img/avatar.png" alt="alt"/></td>
                                             <td class="infocell">${a.student.code}</td>
                                             <td class="infocell">${a.student.name}</td>
                                             <td class="infocell">
                                                  <input type="radio" 
                                                         <c:if test="${!a.status}">
                                                              checked="checked" 
                                                         </c:if>
                                                         name="status${a.student.id}" value="Absent"/> Absent
                                                  <input type="radio" 
                                                         <c:if test="${a.status}">
                                                              checked="checked" 
                                                         </c:if>
                                                         name="status${a.student.id}" value="Attended" /> Attended
                                             </td>
                                             <td class="infocell">
                                                  <input type="hidden" name="sid" value="${a.student.id}"/>
                                                  <input type="hidden" name="aid${a.student.id}" value="${a.id}"/>
                                                  <input type="text" name="description${a.student.id}" value="${a.description}"/></td>
                                        </tr>    
                                   </c:forEach>
                              </tbody>
                         </table>
                         <input type="hidden" name="sesid" value="${param.sesid}"/>
                         <div class="submitButton">
                              <input type="submit" value="Save"/>
                         </div>
                    </form>
               </div>
          </div>
     </body>
</html>
