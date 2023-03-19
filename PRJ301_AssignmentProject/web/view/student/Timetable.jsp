<%-- 
    Document   : Timetable
    Created on : Mar 17, 2023, 11:59:07 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Timetable</title>
    </head>
    <body>
         <div class="container" style="margin-left: 200px">
            <div class="row" style="display: flex">
                <div class="col-md-8" style="margin-left: 200px">
                    <h1><span>FPT University Academic Portal</span></h1>
                </div>
                
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 200px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>View Schedule</strong></h3></a>
                </div>
                <div class="col-md-6" style="margin-left: 680px">
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            <a style="color: white" href="student/info">${s.account.accountName}</a>
                        </button>
                    </c:forEach>
                    |
                    <button style="background-color: rgb(67, 205, 128)">
                        <a style="color: white" href="http://localhost:9999/PRJ_Assignment/logout">Logout</a>
                    </button>
                </div>
            </div>
            <form style="margin-left: 200px" action="timetable" method="GET">
                <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                    <h1>Activities for ${s.code} (${s.name})</h1>
                </c:forEach>
                <table style="border: solid 2px black">
                    <thead>
                        <tr style="background-color: orange">
                            <th style="text-align: left">From: <input type="date" name="from"/><br/>
                                To: <input type="date" name="to"/><br/>
                            </th>
                            <th>
                                <input style="height: 45px;background-color: orange" type="submit" value="Enter"/>
                            </th>
                        </tr>
                    </thead>
                </table>
            </form>
            <div style="margin-left: 200px">
                <c:if test="${requestScope.dates ne null}">
                    <table style="border: 2px solid black;" border="1px"> 
                        <tr style="background-color: orange">
                            <td></td>
                            <c:forEach items="${requestScope.dates}" var="d">
                                <td><fmt:formatDate value="${d}" type="date"/><br/><fmt:formatDate value="${d}" pattern="EEEE"/>
                                </td>
                            </c:forEach>
                        </tr>
                        <c:forEach items="${requestScope.slots}" var="slot"> 
                            <tr>
                                <td style="background-color: rgb(234, 234, 234)">Slot ${slot.id}</td>
                                <c:forEach items="${requestScope.dates}" var="d">
                                    <td style="width: 120px">
                                        <c:forEach items="${requestScope.s.groups}" var="g">
                                            <c:forEach items="${g.sessions}" var="ses" varStatus="loop">
                                                <c:if test="${ses.date eq d and ses.slot.id eq slot.id}">
                                                    <a style="color: blue" href="session/info?session=${ses.id}">${ses.course.code}</a><br/>
                                                    at ${ses.room.name} <br/>
                                                    <c:if test="${ses.status eq true}">
                                                        <c:if test="${ses.attendance.status eq true}">
                                                            <b style="color: rgb(67, 205, 128)">(Attended)</b><br/>
                                                        </c:if>
                                                        <c:if test="${ses.attendance.status eq false}">
                                                            <b style="color: red">(Absent)</b><br/>
                                                        </c:if>
                                                    </c:if>
                                                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                                                        <c:if test="${ses.status eq false}">
                                                            <b style="color: red">(Not yet)</b><br/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <button style="background-color: rgb(67, 205, 128); color: white">
                                                        ${ses.slot.name}
                                                    </button>
                                                </c:if>
                                            </c:forEach>
                                        </c:forEach>
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
        </div>
    </body>
</html>
