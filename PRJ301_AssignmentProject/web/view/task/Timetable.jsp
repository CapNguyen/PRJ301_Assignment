<%-- 
    Document   : timetable
    Created on : Mar 12, 2023, 9:23:59 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Timetable</title>
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
                         <h3><strong>View Schedule</strong></h3>
                    </div>
                    <div class="col-md-6" style="margin-left: 680px">
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
                              <button style="background-color: #5cb85c; color: white">
                                   ${cs.name}
                              </button>
                         </c:forEach>
                    </div>
               </div>
               <div class="content" >
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                         <h1>Activities for ${s.code} (${s.name})</h1>
                    </c:forEach>
               </div>
               <div class="content">
                    <p>
                         <b>Note</b>
                         : These activities do not include extra-curriculum activities, such as
                         club activities ...

                    </p>
                    <p>
                         <b>Chú thích</b>
                         : Các hoạt động trong bảng dưới không bao gồm hoạt động ngoại khóa,
                         ví dụ như hoạt động câu lạc bộ ...

                    </p>
                    <div id="ctl00_mainContent_ghichu">
                         <p>
                              Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL...<br/>
                              Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,..<br/>
                              Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...<br/>
                              Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.<br/>
                              Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..<br/>
                              Little UK (LUK) thuộc tầng 5 tòa nhà Delta
                         </p>
                    </div>
               </div>
               <div class="content">
                    <c:if test="${requestScope.dates ne null}">
                         <table style="border: 2px solid black;" border="1px"> 
                              <tr style="background-color: #6b90da">
                                   <td>
                                        <form action="timetable" method="GET">
                                             <table style="border:none">
                                                  <thead>
                                                       <tr>
                                                            <th style="text-align: left">From: <input type="date" name="from"/><br/>
                                                                 To: <input type="date" name="to"/><br/>
                                                            </th>
                                                            <th>
                                                                 <input style="height: 45px;" type="submit" value="Enter"/>
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
                                             <td class="infocell">
                                                  <c:forEach items="${requestScope.s.groups}" var="g">
                                                       <c:forEach items="${g.sessions}" var="ses" varStatus="loop">
                                                            <c:if test="${ses.date eq d and ses.slot.id eq slot.id}">
                                                                 <a style="color: blue" href="session/info?session=${ses.id}">${ses.course.code}</a><br/>
                                                                 at ${ses.room.name} <br/>
                                                                 <c:if test="${ses.status eq true}">
                                                                      <c:if test="${ses.attendance.status eq true}">
                                                                           <b style="color: #5cb85c">(Attended)</b><br/>
                                                                      </c:if>
                                                                      <c:if test="${ses.attendance.status eq false}">
                                                                           <b style="color: red">(Absent)</b><br/>
                                                                      </c:if>
                                                                 </c:if>
                                                                 <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                                                                      <c:if test="${ses.status eq false}">
                                                                           <b>(Not yet)</b><br/>
                                                                      </c:if>
                                                                 </c:forEach>
                                                                 <button style="background-color: #5cb85c; color: white">
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
               <div style="margin-left: 200px">
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop"> 
                         <ul>
                              <li>
                                   (<font color='green'>attended</font>
                                   ): ${s.account.accountName} had attended this activity / ${s.name} đã tham gia hoạt động này
                              </li>
                              <li>
                                   (<font color='red'>absent</font>
                                   ): ${s.account.accountName} had NOT attended this activity / ${s.name} đã vắng mặt buổi này
                              </li>
                              <li>(-): no data was given / chưa có dữ liệu</li>
                         </ul>
                    </c:forEach>
               </div>
          </div>
     </body>
</html>
