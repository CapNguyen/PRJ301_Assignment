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
          <style>
               a {
                    text-decoration: none ;
               }
               a:active{
                    text-decoration: underline ;
               }
               button {
                    border: none;
               }
               button:focus {
                    border: none;
                    outline: none;
               }
               td,tr{

                    border-bottom:  1px solid black;
                    border-right:  1px solid black;
               }
          </style>
     </head>
     <body>
          <div class="container">

               <div class="row" style="display: flex">
                    <div class="col-md-8" style="margin-left: 200px">
                         <h1><span>FPT University Academic Portal</span></h1>
                    </div>
               </div>
               <div class="row" style="background-color: #f5f5f5; height: 40px; width: 1100px; margin-top: 30px; margin-left: 200px; display: flex">
                    <div class="col-md-6" style="text-align: left; display: flex">
                         <a style="margin-left: 20px;" href="${pageContext.request.contextPath}/timetable">
                              <h3 style="margin-top: 8px"><strong>Timetable</strong></h3>
                         </a>
                         <h3 style="margin-left: 20px;margin-top: 8px"><span><strong>| View Schedule</strong></span></h3>
                    </div>
                    <div class="col-md-6" style="margin-left: 580px">
                         <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                              <button style="background-color: #5cb85c; color: white">
                                   <a style="color: white" href="student/info">${s.account.accountName}</a>
                              </button>
                         </c:forEach>
                         |
                         <button style="background-color: #5cb85c">
                              <a style="color: white" href="logout">Logout</a>
                         </button>
                         |
                         <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                              <button style="background-color: #5cb85c; color: white">
                                   ${cs.name}
                              </button>
                         </c:forEach>
                    </div>
               </div>
               <div class="row" style="margin-top: 50px; margin-left: 200px; display: flex">
                    <div>
                         <table style=" border: 2px solid black">
                              <caption style="text-align: center; font-size: large"><h1>Select a campus/program, term,<br/> course ...</h1></caption>
                              <thead style="background-color: #6b90da;">
                                   <tr>
                                        <th scope="col" style="width: 100px; text-align: left;">Campus</th>
                                        <th scope="col" style="width: 420px; text-align: left;">Course</th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <tr>
                                        <td valign="top">
                                             <table border="1">
                                                  <tr>
                                                       <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">
                                                            ${cs.name}
                                                       </c:forEach>
                                                  </tr>
                                             </table> 
                                        </td>
                                        <td valign="top">
                                             <table border="1">
                                                  <tr>
                                                       <c:forEach items="${requestScope.courses}" var="c" varStatus="loop">
                                                       <a href ="${pageContext.request.contextPath}/AC?course=${c.id}" value="${c.name}(${c.code})">${c.name}(${c.code})</a><br/>
                                                  </c:forEach>
                                   </tr>
                         </table> 
                         </td>
                         </tr>
                         </tbody>
                         </table>
                    </div>
                    <div>
                         <table style=" border: 2px solid black">
                              <caption style="text-align: center; font-size: large; margin-bottom: 24px"><h1>... then see report</h1></caption>
                              <br/>
                              <thead style="background-color: #6b90da;">
                                   <tr>
                                        <th scope="col" style="height: 50px;width: 40px; text-align: left;">NO</th>
                                        <th scope="col" style="width: 110px; text-align: left;">DATE</th>
                                        <th scope="col" style="width: 110px; text-align: left;">SLOT</th>
                                        <th scope="col" style="width: 60px; text-align: left;">ROOM</th>
                                        <th scope="col" style="width: 100px; text-align: left;">LECTURER</th>
                                        <th scope="col" style="width: 80px; text-align: left;">GROUP NAME</th>
                                        <th scope="col" style="width: 120px; text-align: left;">ATTENDANCE STATUS</th>
                                        <th scope="col" style="width: 120px; text-align: left;">LECTURER'S COMMENT</th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <c:forEach items="${requestScope.ses1}" var="ss" varStatus="loop">
                                        <tr>
                                             <td valign="top" style="height: 50px">
                                                  ${loop.index+1}
                                             </td>
                                             <td valign="top">
                                                  <button style="background-color: #337ab7; color: white; border: 0px">
                                                       <fmt:formatDate value="${ss.date}" pattern="EEEE"/> <fmt:formatDate value="${ss.date}" type="date"/>
                                                  </button>
                                             </td>
                                             <td valign="top">
                                                  <button style="background-color: #d9534f; color: white; border: 0px">
                                                       ${ss.slot.id}_(${ss.slot.name})
                                                  </button>
                                             </td>
                                             <td valign="top">${ss.room.name}</td>
                                             <td valign="top">${ss.lecturer.code}</td>
                                             <td valign="top">${ss.group.name}</td>
                                             <td valign="top">
                                                  <c:if test="${ss.status eq true}">
                                                       <c:if test="${ss.attendance.status eq true}">
                                                            <b style="color: rgb(67, 205, 128)">Present</b><br/>
                                                       </c:if>
                                                       <c:if test="${ss.attendance.status eq false}">
                                                            <b style="color: red">Absent</b><br/>
                                                       </c:if>
                                                  </c:if>
                                                  <c:if test="${ss.status eq false}">
                                                       <b style="color: black">Future</b><br/>
                                                  </c:if>
                                             </td>
                                             <td valign="top">${ss.attendance.description}</td>
                                        </tr>
                                   </c:forEach>
                              </tbody>
                         </table>
                    </div>
               </div>
          </div>
     </body>

</html>
