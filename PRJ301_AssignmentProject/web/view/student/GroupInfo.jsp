<%-- 
    Document   : GroupInfo
    Created on : Mar 17, 2023, 11:59:39 PM
    Author     : admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >

     <head>
          <meta charset="UTF-8">
          <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
          <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
          <title>Group Info</title>
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
                         <c:if test="${requestScope.stu ne null}">
                              <a style="margin-left: 20px;" href="../timetable">
                                   <h3 style="margin-top: 8px"><strong>Timetable</strong></h3>
                              </a>
                         </c:if>
                         <c:if test="${requestScope.lect ne null}">
                              <a style="margin-left: 20px;" href="../schedule">
                                   <h3 style="margin-top: 8px"><strong>Schedule</strong></h3>
                              </a>
                         </c:if>
                         <h3 style="margin-top: 8px; margin-left: 20px"><strong>| User detail</strong></h3>               
                    </div>
                    <div class="col-md-6" style="margin-left: 600px">
                         <c:if test="${requestScope.stu ne null}">
                              <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                                   <button style="background-color: #5cb85c; color: white">
                                        <a style="color: white" href="${pageContext.request.contextPath}/student/info">${s.account.accountName}</a>
                                   </button>
                              </c:forEach>
                         </c:if>
                         <c:if test="${requestScope.lect ne null}">
                              <c:forEach items="${requestScope.lect}" var="l" varStatus="loop">          
                                   <button style="background-color: #5cb85c; color: white">
                                        <a style="color: white" href="lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>                                   </button>
                                   </c:forEach>
                              </c:if>
                         |
                         <button style="background-color: #5cb85c">
                              <a style="color: white" href="/logout">Logout</a>
                         </button>
                         |
                         <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                              <button style="background-color: #5cb85c; color: white">
                                   ${cs.name}
                              </button>
                         </c:forEach>
                    </div>
               </div>
               <div class="row" style="margin-top: 50px;">
                    <div style="margin-left: 200px;">
                         <table style=" border: 2px solid black">
                              <caption style="text-align: left; font-size: large"><h1>Select a course, then a group...</h1></caption>
                              <thead style="background-color: #6b90da;">
                                   <tr>
                                        <th scope="col" style="width: 100px; text-align: left;">Campus</th>
                                        <th scope="col" style="width: 420px; text-align: left;">Course</th>
                                        <th scope="col" style="width: 240px; text-align: left;">Group</th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <tr>
                                        <td valign="top">
                                             <div>
                                                  <table border="1">
                                                       <tbody>
                                                            <tr>
                                                                 <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">
                                                                      ${cs.name}
                                                                 </c:forEach>
                                                            </tr>
                                                       </tbody>
                                                  </table> 
                                             </div>
                                        </td>
                                        <td valign="top">
                                             <div>
                                                  <table border="1">
                                                       <tbody>
                                                            <tr>
                                                                 <c:forEach items="${requestScope.courses}" var="c" varStatus="loop">
                                                            <a href = "${pageContext.request.contextPath}/student/group?course=${c.id}" value="${c.name} (${c.code})">${c.name} (${c.code})</a><br/>
                                                       </c:forEach>
                                                       </tr>
                                                       </tbody>
                                                  </table> 
                                             </div>
                                        </td>
                                        <td valign="top">
                                             <div>
                                                  <table border="1">
                                                       <tbody>
                                                            <tr>
                                                                 <c:if test="${requestScope.groups ne null}">
                                                                      <c:forEach items="${requestScope.groups}" var="g" varStatus="loop">
                                                                 <a href = "${pageContext.request.contextPath}/student/group?class=${g.id}" value="${g.name}">${g.name}</a><br/>
                                                            </c:forEach>
                                                       </c:if>                                                  
                                                       </tr>
                                                       </tbody>
                                                  </table> 
                                             </div>
                                        </td>
                                   </tr>
                              </tbody>
                         </table>
                    </div>
               </div>
               <div class="row">
                    <c:if test="${requestScope.students ne null}">
                         <table style="margin-left: 200px; margin-top: 50px; border: 2px solid black">
                              <caption style="text-align: left; font-size: large;">...then see the student list</caption>
                              <thead>
                                   <tr style="background-color: #6b90da;">
                                        <th style="width: 100px; text-align: left;">INDEX</th>
                                        <th style="width: 100px; text-align: left;">IMAGE</th>
                                        <th style="width: 100px; text-align: left;">CODE</th>
                                        <th style="width: 280px; text-align: left;">FULL NAME</th>
                                        <th style="width: 200px; text-align: left;">Date of Birth</th>
                                        <th style="width: 200px; text-align: left;">Email</th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <c:forEach items="${requestScope.students}" var="s" varStatus="loop">
                                        <tr>
                                             <td><strong>${loop.index + 1}</strong></td>
                                             <td style="text-align: center"><img src="${s.img}" alt="alt"/></td>
                                             <td>${s.code}</td>
                                             <td>${s.name}</td>
                                             <td>
                                                  <fmt:formatDate type = "date" value = "${s.dob}" />
                                             </td>
                                             <td>${s.email}</td>
                                        </tr>
                                   </c:forEach>
                              </tbody>
                         </table>
                    </c:if>                                                  
               </div>
          </div>
     </body>

</html>
