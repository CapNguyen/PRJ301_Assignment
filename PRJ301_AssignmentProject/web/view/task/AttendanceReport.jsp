<%-- 
    Document   : AttendanceReport
    Created on : Mar 22, 2023, 11:28:34 AM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Attendance Report</title>
          <link href="${pageContext.request.contextPath}/css/jsp.css" rel="stylesheet" type="text/css"/>


     </head>
     <body>
          <div class="container">
               <div class="row"x>
                    <div class="col-md-8">
                         <h1><span>FPT University Academic Portal</span></h1>
                    </div>
               </div>
               <div class="row" id="row2">
                    <div class="col-md-6" style="text-align: left; display: flex">
                         <h3><strong>View Schedule</strong></h3>
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
                    <h1>Attendance summary report</h1>
                    <table>
                         <thead>
                              <tr style="background-color: rgb(0, 179, 255);">
                                   <th style="width: 50px; text-align: left;">INDEX</th>
                                   <th style="width: 180px; text-align: left;">IMAGE</th>
                                   <th style="width: 100px; text-align: left;">CODE</th>
                                   <th style="width: 200px; text-align: left;">FULL NAME</th>
                                        <c:forEach items="${requestScope.ss}" var="ss" varStatus="loop">
                                        <th>Slot ${loop.index + 1}</th>
                                        </c:forEach>
                                   <th style="width: 170px; text-align: center;">ABSENT</th>
                              </tr>
                         </thead>
                         <tbody>
                              <c:forEach items="${requestScope.students}" var="s" varStatus="loop">
                              <script>
                                   var absent = 0;
                              </script>
                              <tr>
                                   <td class="tdHeading">${loop.index + 1}</strong></td>
                                   <td class="infocell"><img src="${pageContext.request.contextPath}/img/avatar.png" alt="alt"/></td>
                                   <td class="infocell">${s.code}</strong></td>
                                   <td class="infocell">${s.name}</strong></td>
                                   <c:forEach items="${requestScope.att}" var="att" varStatus="loops">
                                        <c:if test="${att.student.id eq s.id}">
                                             <c:if test="${att.session.status eq true}">
                                                  <c:if test="${att.status eq true}">
                                                       <td class="infocell" style="text-align: center"><b style="color: #5cb85c">P</b><br/></td>
                                                       </c:if>
                                                       <c:if test="${att.status eq false}">
                                                       <td class="infocell" style="text-align: center"><b style="color: red">A</b><br/></td>
                                                  <script>
                                                       absent = absent + 1;
                                                  </script>
                                             </c:if>
                                        </c:if>
                                        <c:if test="${att.session.status eq false}">
                                             <td style="text-align: center"><b>_</b><br/></td>
                                             </c:if>
                                        </c:if>
                                   <script>
                                        var count = "${loops.index+1}";
                                   </script>
                              </c:forEach>
                              <script>
                                   var average = absent / count * 100;
                                   var round = Math.round((average + Number.EPSILON) * 100) / 100;
                              </script>    
                              <td class="infocell" style="text-align: center"><strong>
                                        <script>
                                             document.write(round + "%");
                                        </script>
                                   </strong>
                              </td>
                              </tr>
                         </c:forEach>
                         </tbody>
                    </table>
                    <h2>If a student were absent from class more than 20% of slots, they would <strong style ="color:red">NOT PASS</strong> the course</h2>
               </div>
          </div>
     </body>
</html>
