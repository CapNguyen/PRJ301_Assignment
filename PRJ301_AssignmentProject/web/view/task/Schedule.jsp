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
                         <h3><strong>View Schedule</strong></h3></a>
                    </div>
                    <div class="col-md-6" style="margin-left: 750px">
                         <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">          
                              <button>
                                   <a href="lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>
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
                    </div>
               </div>
               <div class="content" >
                    <c:forEach items="${requestScope.lec}" var="l" varStatus="loop">          
                         <h1>Activities for ${l.code} (${l.name})</h1>
                    </c:forEach>
               </div>
               <br/>
               <div class="content">
                    <c:if test="${requestScope.dates ne null}">
                         <table border="1px"> 
                              <tr>
                                   <td>
                                        <form action="schedule" method="GET">
                                             <table>
                                                  <thead>
                                                       <tr>
                                                            <th class="contentCell" style="text-align: left">From: <input type="date" name="from"/><br/>
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
                                        <td><fmt:formatDate value="${d}" type="date"/><br/>
                                             <fmt:formatDate value="${d}" pattern="EEEE"/>
                                        </td>
                                   </c:forEach>

                              </tr>
                              <c:forEach items="${requestScope.slots}" var="slot"> 
                                   <tr>
                                        <td class="tdHeading">Slot ${slot.id}</td>
                                        <c:forEach items="${requestScope.dates}" var="d">
                                             <td class="contentCell">
                                                  <c:forEach items="${requestScope.l.sessions}" var="ses">
                                                       <c:if test="${ses.date eq d and ses.slot.id eq slot.id}">
                                                            <a style="color: blue" href="session/info?session=${ses.id}">${ses.course.code}</a>
                                                            <br/>
                                                            at ${ses.room.name} 
                                                            <br/>
                                                            <c:if test="${ses.status eq true}">
                                                                 <a style="color: orange" href="AT?sesid=${ses.id}">(Update)</a>
                                                            </c:if>
                                                            <c:if test="${ses.status eq false}">
                                                                 <a style="color: red" href="AT?sesid=${ses.id}">(Take attendance)</a>
                                                            </c:if>
                                                            <br/>
                                                            <a class="report" href="AR?session=${ses.id}">Attendance summary</a>
                                                            <button>${ses.slot.name}</button>
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
