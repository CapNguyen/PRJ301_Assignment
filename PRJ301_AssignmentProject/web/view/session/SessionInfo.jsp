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
        <style>
               a {
                    text-decoration: none !important;
               }
               button,table {
                    border: none;
               }
               button:focus {
                    border: none;
                    outline: none;
               }
          </style>
    </head>
    <body>
        <div class="container" >
            <div class="row" style="display: flex">
                <div class="col-md-8" style="margin-left: 200px">
                    <h1><span>FPT University Academic Portal</span></h1>
                </div>
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 200px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <c:if test="${requestScope.stu ne null}">
                        <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                            <a style="margin-left: 20px;" href="../timetable"><h3 style="margin-top: 8px"><strong>Timetable</strong></h3></a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.lect ne null}">
                        <c:forEach items="${requestScope.lect}" var="s" varStatus="loop">          
                            <a style="margin-left: 20px;" href="../schedule"><h3 style="margin-top: 8px"><strong>Schedule</strong></h3></a>
                        </c:forEach>
                    </c:if>
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>| View</strong></h3></a>               
                </div>
                <div class="col-md-6" style="margin-left: 640px">
                    <c:if test="${requestScope.stu ne null}">
                        <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                            <button style="background-color: rgb(67, 205, 128); color: white">
                                <a style="color: white" href="../student/info">${s.account.accountName}</a>
                            </button>
                        </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.lect ne null}">
                        <c:forEach items="${requestScope.lect}" var="l" varStatus="loop">          
                            <button style="background-color: rgb(67, 205, 128); color: white">
                                <a style="color: white" href="../lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
                            </button>
                        </c:forEach>
                    </c:if>
                    |
                    <button style="background-color: rgb(67, 205, 128)">
                        <a style="color: white" href="logout">Logout</a>
                    </button>
                </div>
            </div>
            <table style="margin-left: 200px;">
                <tbody>
                    <tr>
                        <td>
                            <div>
                                <h2 style="margin-left: 50px">Activity detail</h2>
                                <br/>
                            </div>
                            <table>
                                <tbody>
                                    <c:forEach items="${requestScope.sessions}" var="s" varStatus="loop">
                                        <tr>
                                            <td style="width: 550px; border-bottom: solid lightgray 1px"><b>Date:</b></td>
                                            <td style="width: 550px; border-bottom: solid lightgray 1px"><fmt:formatDate value="${s.date}" pattern="EEEE"/> - <fmt:formatDate value="${s.date}" type="date"/></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Slot:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px">${s.slot.id}</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Student group:</b></td>                                    
                                            <td style=" border-bottom: solid lightgray 1px"><a style="color: blue" href="../student/group?class=${s.group.id}">${s.group.name}</a></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Instructor:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"><a style="color: blue" href="../lecturer/info?lecturer=${s.lecturer.id}">${s.lecturer.code}</a></td>

                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Course:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px">${s.course.name}(${s.course.code})</td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Course session number:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Course session type:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"></td>
                                        </tr>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Course session description:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"></td>
                                        </tr>
                                        <tr>
                                            <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                                                <td style=" border-bottom: solid lightgray 1px"><b>Campus/Programme:</b></td>
                                                <td style=" border-bottom: solid lightgray 1px">${cs.name}</td>
                                            </c:forEach>
                                        </tr>
                                        <c:if test="${requestScope.stu ne null}">
                                            <tr>
                                                <td style=" border-bottom: solid lightgray 1px"><b>Attendance:</b></td>
                                                <c:if test="${s.status eq true}">
                                                    <c:if test="${s.attendance.status eq true}">
                                                        <td style=" border-bottom: solid lightgray 1px"><b>Attended</b></td>
                                                    </c:if>
                                                    <c:if test="${s.attendance.status eq false}">
                                                        <td style=" border-bottom: solid lightgray 1px"><b>Absent</b></td>
                                                    </c:if>
                                                </c:if>
                                                <c:if test="${s.status eq false}">
                                                    <td style=" border-bottom: solid lightgray 1px"><b>Not Yet</b></td>
                                                </c:if>
                                            </tr>
                                        </c:if>
                                        <c:if test="${requestScope.lect ne null}">
                                            <tr>
                                                <td style=" border-bottom: solid lightgray 1px"><b>Attendance:</b></td>
                                                <c:if test="${s.status eq true}">
                                                    <td style=" border-bottom: solid lightgray 1px"><a href="attendance?sesid=${s.id}">Update</a></td>
                                                </c:if>
                                                <c:if test="${s.status eq false}">
                                                    <td style=" border-bottom: solid lightgray 1px"><a href="attendance?sesid=${ses.id}">Take attendance</a></td>
                                                </c:if>
                                            </tr>
                                        </c:if>
                                        <tr>
                                            <td style=" border-bottom: solid lightgray 1px"><b>Record time:</b></td>
                                            <td style=" border-bottom: solid lightgray 1px"></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </td> 
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
