<%-- 
    Document   : SessionInfo
    Created on : Mar 17, 2023, 11:58:19 PM
    Author     : admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Session Info</title>
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
                              <a href="../timetable">
                                   <h3 s><strong>Timetable</strong></h3>
                              </a>
                              <h3 ><strong>| User detail</strong></h3>               
                         </div>
                         <div class="col-md-6" style="margin-left: 600px">
                              <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                                   <button>
                                        <a href="">${s.account.accountName}</a>
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
                         </c:if>
                         <c:if test="${requestScope.lect ne null}">
                              <a href="../schedule">
                                   <h3><strong>Schedule</strong></h3>
                              </a>
                              <h3><strong>| User detail</strong></h3>               
                         </div>
                         <div class="col-md-6" style="margin-left: 600px">
                              <c:forEach items="${requestScope.lect}" var="l" varStatus="loop">          
                                   <button>
                                        <a href="">${l.account.accountName}</a>
                                   </button>
                              </c:forEach>

                              |
                              <button >
                                   <a href="logout">Logout</a>
                              </button>
                              |
                              <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                                   <button>
                                        ${cs.name}
                                   </button>
                              </c:forEach>
                         </c:if>

                    </div>
               </div>
               <div class="content">
                    <div>
                         <h2>Activity detail</h2>
                         <br/>
                    </div>
                    <table class="infotable">
                         <tbody>
                              <c:forEach items="${requestScope.sessions}" var="s" varStatus="loop">
                                   <tr>
                                        <td class="infocell"><b>Date:</b></td>
                                        <td class="infocell"><fmt:formatDate value="${s.date}" pattern="EEEE"/> - <fmt:formatDate value="${s.date}" type="date"/></td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Slot:</b></td>
                                        <td class="infocell">${s.slot.id}</td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Student group:</b></td>                                    
                                        <td class="infocell"><a style="color: blue" href="../student/group?class=${s.group.id}">${s.group.name}</a></td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Instructor:</b></td>
                                        <td class="infocell"><a style="color: blue" href="../lecturer/info?lecturer=${s.lecturer.id}">${s.lecturer.code}</a></td>

                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Course:</b></td>
                                        <td class="infocell">${s.course.name}(${s.course.code})</td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Course session number:</b></td>
                                        <td class="infocell"></td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Course session type:</b></td>
                                        <td class="infocell"></td>
                                   </tr>
                                   <tr>
                                        <td class="infocell"><b>Course session description:</b></td>
                                        <td class="infocell"></td>
                                   </tr>
                                   <tr>
                                        <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                                             <td class="infocell"><b>Campus/Programme:</b></td>
                                             <td class="infocell">${cs.name}</td>
                                        </c:forEach>
                                   </tr>
                                   <c:if test="${requestScope.stu ne null}">
                                        <tr>
                                             <td class="infocell"><b>Attendance:</b></td>
                                             <c:if test="${s.status eq true}">
                                                  <c:if test="${s.attendance.status eq true}">
                                                       <td class="infocell"><b>Attended</b></td>
                                                  </c:if>
                                                  <c:if test="${s.attendance.status eq false}">
                                                       <td class="infocell"><b>Absent</b></td>
                                                  </c:if>
                                             </c:if>
                                             <c:if test="${s.status eq false}">
                                                  <td class="infocell"><b>Not Yet</b></td>
                                             </c:if>
                                        </tr>
                                   </c:if>
                                   <c:if test="${requestScope.lect ne null}">
                                        <tr>
                                             <td class="infocell"><b>Attendance:</b></td>
                                             <c:if test="${s.status eq true}">
                                                  <td class="infocell"><a href="${pageContext.request.contextPath}/AT?sesid=${s.id}">Update</a></td>
                                             </c:if>
                                             <c:if test="${s.status eq false}">
                                                  <td class="infocell"><a href="${pageContext.request.contextPath}/AT?sesid=${s.id}">Take attendance</a></td>
                                             </c:if>
                                        </tr>
                                   </c:if>
                                   <tr>
                                        <td class="infocell"><b>Record time:</b></td>
                                        <td class="infocell"></td>
                                   </tr>
                              </c:forEach>
                         </tbody>
                    </table>
               </div>
          </div>
     </body>
</html>
