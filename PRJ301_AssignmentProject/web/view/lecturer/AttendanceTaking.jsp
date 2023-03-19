<%-- 
    Document   : AttendanceTaking
    Created on : Mar 17, 2023, 11:57:53 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body> <div class="container" style="margin-left: 200px">
            <div class="row" style="display: flex">
                <div class="col-md-8" style="margin-left: 200px">
                    <h1><span>FPT University Academic Portal</span></h1>
                </div>
               
            </div>
            <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 200px; display: flex">
                <div class="col-md-6" style="text-align: left; display: flex">
                    <h3 style="margin-top: 8px; margin-left: 20px"><strong>View Schedule</strong></h3></a>
                </div>
                <div class="col-md-6" style="margin-left: 670px">
                    <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">          
                        <button style="background-color: rgb(67, 205, 128); color: white">
                            <a style="color: white" href="lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
                        </button>
                    </c:forEach>
                    |
                    <button style="background-color: rgb(67, 205, 128)">
                        <a style="color: white" href="http://localhost:9999/PRJ_Assignment/logout">Logout</a>
                    </button>
                    
                </div>
            </div>
            <form action="attendance" method="POST"> 
                <table style="margin-left: 200px; margin-top: 50px; border: 2px solid black">
                    <thead>
                        <tr style="background-color: rgb(0, 179, 255);">
                            <th style="width: 80px; text-align: left;">INDEX</th>
                            <th style="width: 180px; text-align: left;">IMAGE</th>
                            <th style="width: 140px; text-align: left;">CODE</th>
                            <th style="width: 280px; text-align: left;">FULL NAME</th>
                            <th style="width: 200px; text-align: left;">ATTENDANCE STATUS</td>
                            <th style="width: 200px; text-align: left;">LECTURER'S COMMENT</td>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${requestScope.atts}" var="a" varStatus="loop">
                            <tr>
                                <td style="background-color: #dddddd"><strong>${loop.index +1}</strong></td>
                                <td><img src="${a.student.img}" alt="alt"/></td>
                                <td>${a.student.code}</td>
                                <td>${a.student.name}</td>
                                <td>
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
                                <td>
                                    <input type="hidden" name="sid" value="${a.student.id}"/>
                                    <input type="hidden" name="aid${a.student.id}" value="${a.id}"/>
                                    <input type="text" name="description${a.student.id}" value="${a.description}"/></td>
                            </tr>    
                        </c:forEach>
                    </tbody>
                </table>
                <input type="hidden" name="sessionid" value="${param.sesid}"/>
                <input style="width:  60px; height: 40px; margin-left: 1250px; border: solid black 1px; " type="submit" value="Save"/>
            </form>
            
        </div>
    </body>
</html>
