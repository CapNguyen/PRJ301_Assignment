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
               <div class="row" style="background-color: #f5f5f5; height: 40px; width: 1100px; margin-top: 30px; margin-left: 200px; display: flex">
                    <div class="col-md-6" style="text-align: left; display: flex">
                         <h3 style="margin-top: 8px; margin-left: 20px"><strong>View Schedule</strong></h3>
                    </div>
                    <div class="col-md-6" style="margin-left: 680px">
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
               <div style="margin-left: 200px" action="timetable" method="GET">
                    <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                         <h1>Activities for ${s.code} (${s.name})</h1>
                    </c:forEach>
               </div>
               <div style="margin-left: 200px">
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
               <div style="margin-left: 200px">
                    <c:if test="${requestScope.dates ne null}">
                         <table style="border: 2px solid black;" border="1px"> 
                              <tr style="background-color: #6b90da">
                                   <td>
                                        <form action="timetable" method="GET">
                                             <table style="border: solid 2px black">
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
                                             <td style="width: 120px">
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
                                                                           <b style="color: red">(Not yet)</b><br/>
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
