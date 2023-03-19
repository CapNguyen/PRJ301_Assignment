<%-- 
    Document   : Schedule
    Created on : Mar 17, 2023, 11:58:08 PM
    Author     : admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Schedule</title>
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
          <div class="container">
               <div class="row" style="display: flex">
                    <div class="col-md-8" style="margin-left: 200px">
                         <h1><span>FPT University Academic Portal</span></h1>
                    </div>
               </div>
               <div class="row" style="background-color: rgb(234, 234, 234); height: 40px; width: 1100px; margin-top: 30px; margin-left: 200px; display: flex">
                    <div class="col-md-6" style="text-align: left; display: flex">
                         <h3 style="margin-top: 8px; margin-left: 20px"><strong>View Schedule</strong></h3></a>
                    </div>
                    <div class="col-md-6" style="margin-left: 750px">
                         <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">          
                              <button style="background-color: #5cb85c; color: white">
                                   <a style="color: white" href="lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
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
               <div style="margin-left: 200px" >
                    <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">          
                         <h1>Activities for ${l.code} (${l.name})</h1>
                    </c:forEach>
               </div>
               <br/>
               <div style="margin-left: 200px">
                    <c:if test="${requestScope.dates ne null}">
                         <table style="border: 2px solid black;" border="1px"> 
                              <tr style="background-color: #6b90da">
                                   <td>
                                        <form action="schedule" method="GET">
                                             <table style="border: solid 2px black">
                                                  <thead>
                                                       <tr style="background-color: #6b90da">
                                                            <th style="text-align: left">From: <input type="date" name="from"/><br/>
                                                                 To: <input type="date" name="to"/><br/>
                                                            </th>
                                                            <th>
                                                                 <input style="height: 45px" type="submit" value="Enter"/>
                                                            </th>
                                                       </tr>
                                                  </thead>
                                             </table>
                                        </form>
                                   </td>
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
                                                  <c:forEach items="${requestScope.l.sessions}" var="ses">
                                                       <c:if test="${ses.date eq d and ses.slot.id eq slot.id}">
                                                            <a style="color: blue" href="session/info?session=${ses.id}">${ses.course.code}</a><br/>
                                                            at ${ses.room.name} <br/>
                                                            <c:if test="${ses.status eq true}">
                                                                 <a style="color: orange" href="AT?sesid=${ses.id}">(Update)</a>
                                                            </c:if>
                                                            <c:if test="${ses.status eq false}">
                                                                 <a style="color: red" href="AT?sesid=${ses.id}">(Take attendance)</a>
                                                            </c:if>
                                                            <button style="background-color: #5cb85c; color: white">
                                                                 ${ses.slot.name}
                                                            </button>
                                                       </c:if>
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
