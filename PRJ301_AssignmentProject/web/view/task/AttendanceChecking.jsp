<%-- 
    Document   : AttendanceChecking
    Created on : Mar 17, 2023, 11:58:42 PM
    Author     : admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html ">

     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
          <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
          <title>Check Attendance</title>
          <link href="${pageContext.request.contextPath}/css/jsp.css" rel="stylesheet" type="text/css"/>

     </head>
     <body>
          <div class="container">

               <div class="row" >
                    <div class="col-md-8">
                         <h1><span>FPT University Academic Portal</span></h1>
                    </div>
               </div>
               <div class="row" id="row2">
                    <div class="col-md-6" style="text-align: left; display: flex">
                         <a href="${pageContext.request.contextPath}/timetable">
                              <h3><strong>Timetable</strong></h3>
                         </a>
                         <h3 ><span><strong>| View Schedule</strong></span></h3>
                    </div>
                    <div class="col-md-6" style="margin-left: 580px">
                         <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                              <button>
                                   <a href="student/info">${s.account.accountName}</a>
                              </button>
                         </c:forEach>
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
                         <h1>Select a campus/program, term, course ...</h1>
                         <table style=" border: 2px solid black">
                              <thead>
                                   <tr>
                                        <th scope="col" style="width: 100px; text-align: left;">Campus</th>
                                        <th scope="col" style="width: 420px; text-align: left;">Course</th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <tr>
                                        <td valign="top" class="infocell">
                                             <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">
                                                  ${cs.name}
                                             </c:forEach>
                                        </td>
                                        <td valign="top" class="infocell">
                                             <c:forEach items="${requestScope.courses}" var="c" varStatus="loop">
                                                  <a  href ="${pageContext.request.contextPath}/AC?course=${c.id}" value="${c.name}(${c.code})">${c.name}(${c.code})</a>
                                                  <br/>
                                             </c:forEach>

                                        </td>
                                   </tr>
                              </tbody>
                         </table>
                    </div>
                    <div>
                         <table style="max-width: 80%">
                              <h1>... then see report</h1>
                              <br/>
                              <thead>
                                   <tr>
                                        <th scope="col" style="width: 40px; text-align: left;">NO</th>
                                        <th scope="col" style="width: 220px; text-align: left;">DATE</th>
                                        <th scope="col" style="width: 110px; text-align: left;">SLOT</th>
                                        <th scope="col" style="width: 20px; text-align: left;">ROOM</th>
                                        <th scope="col" style="width: 100px; text-align: left;">LECTURER</th>
                                        <th scope="col" style="width: 80px; text-align: left;">GROUP NAME</th>
                                        <th scope="col" style="width: 120px; text-align: left;">ATTENDANCE STATUS</th>
                                        <th scope="col" style="width: 120px; text-align: left;">LECTURER'S COMMENT</th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <c:forEach items="${requestScope.ses1}" var="ss" varStatus="loop">
                                        <tr>
                                             <td valign="top" style="height: 50px" class="tdHeading">
                                                  ${loop.index+1}
                                             </td>
                                             <td valign="top">
                                                  <fmt:formatDate value="${ss.date}" pattern="EEEE"/>
                                                  <br/>
                                                  <fmt:formatDate value="${ss.date}" type="date"/>
                                             </td>
                                             <td valign="top" class="infocell">
                                                  Slot ${ss.slot.id}<br/>(${ss.slot.name})
                                             </td>
                                             <td valign="top" class="infocell">${ss.room.name}</td>
                                             <td valign="top" class="infocell">${ss.lecturer.code}</td>
                                             <td valign="top" class="infocell">${ss.group.name}</td>
                                             <td valign="top" class="infocell">
                                                  <c:if test="${ss.status eq true}">
                                                       <c:if test="${ss.attendance.status eq true}">
                                                            <b style="color: rgb(67, 205, 128)">Present</b><br/>
                                                       </c:if>
                                                       <c:if test="${ss.attendance.status eq false}">
                                                            <b style="color: red">Absent</b><br/>
                                                       </c:if>
                                                  </c:if>
                                                  <c:if test="${ss.status eq false}">
                                                       <b style="color: black">Not yet</b><br/>
                                                  </c:if>
                                             </td>
                                             <td valign="top" class="infocell">${ss.attendance.description}</td>
                                        </tr>
                                   </c:forEach>
                              </tbody>
                         </table>
                    </div>
               </div>
          </div>
     </body>

</html>
