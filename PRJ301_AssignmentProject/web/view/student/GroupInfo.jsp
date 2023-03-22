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
          <link href="${pageContext.request.contextPath}/css/jsp.css" rel="stylesheet" type="text/css"/>

     </head>
     <body>
          <div class="container" >
               <div class="row">
                    <div class="col-md-8">
                         <h1><span>FPT University Academic Portal</span></h1>
                    </div>
               </div>
          </div>
          <div class="row" id="row2">
               <div class="col-md-6" style="text-align: left; display: flex">
                    <c:if test="${requestScope.stu ne null}">
                         <a  href="../timetable">
                              <h3><strong>Timetable</strong></h3>
                         </a>
                    </c:if>
                    <c:if test="${requestScope.lect ne null}">
                         <a  href="../schedule">
                              <h3><strong>Schedule</strong></h3>
                         </a>
                    </c:if>
                    <h3><strong>| User detail</strong></h3>               
               </div>
               <div class="col-md-6" style="margin-left: 600px">
                    <c:if test="${requestScope.stu ne null}">
                         <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                              <button>
                                   <a href="${pageContext.request.contextPath}/student/info">${s.account.accountName}</a>
                              </button>
                         </c:forEach>
                    </c:if>
                    <c:if test="${requestScope.lect ne null}">
                         <c:forEach items="${requestScope.lect}" var="l" varStatus="loop">          
                              <button>
                                   <a href="lecturer/info?lecturer=${l.id}">${l.account.accountName}</a>                                   </button>
                              </c:forEach>
                         </c:if>
                    |
                    <button>
                         <a href="/logout">Logout</a>
                    </button>
                    |
                    <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">          
                         <button>
                              ${cs.name}
                         </button>
                    </c:forEach>
               </div>
          </div>
          <div class="content">
               <div>
                    <table>
                         <strong><h1>Select a course, then a group...</h1></strong>
                         <thead>
                              <tr>
                                   <th scope="col" style="width: 100px">Campus</th>
                                   <th scope="col" style="width: 420px">Course</th>
                                   <th scope="col" style="width: 240px">Group</th>
                              </tr>
                         </thead>
                         <tbody>
                              <tr>
                                   <td valign="top" class="infocell" style="text-align: center">
                                        <div>
                                             <c:forEach items="${requestScope.camps}" var="cs" varStatus="loop">
                                                  ${cs.name}
                                             </c:forEach>
                                        </div>
                                   </td>
                                   <td valign="top" class="infocell">
                                        <div>
                                             <c:forEach items="${requestScope.courses}" var="c" varStatus="loop">
                                                  <a href = "${pageContext.request.contextPath}/student/group?course=${c.id}" value="${c.name} (${c.code})">${c.name} (${c.code})</a><br/>
                                             </c:forEach>
                                        </div>
                                   </td>
                                   <td valign="top" class="infocell" style="text-align: center">
                                        <div>
                                             <c:if test="${requestScope.groups ne null}">
                                                  <c:forEach items="${requestScope.groups}" var="g" varStatus="loop">
                                                       <a href = "${pageContext.request.contextPath}/student/group?class=${g.id}" value="${g.name}">${g.name}</a><br/>
                                                  </c:forEach>
                                             </c:if>                                                  
                                        </div>
                                   </td>
                              </tr>
                         </tbody>
                    </table>
               </div>
          </div>
          <div class="content">
               <c:if test="${requestScope.students ne null}">
                    <table style="margin-top: 50px">
                         <caption style="text-align: left; font-size: large;">...then see the student list</caption>
                         <thead>
                              <tr>
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
                                        <td style="background-color: rgb(234, 234, 234)"><strong>${loop.index + 1}</strong></td>
                                        <td class="infocell" style="text-align: center;border-left:1px black solid"><img src="${pageContext.request.contextPath}/img/avatar.png" alt="alt"/></td>

                                        <td class="infocell" style="text-align: center;border-left:1px black solid">${s.code}</td>
                                        <td class="infocell" style="text-align: center;border-left:1px black solid">${s.name}</td>
                                        <td class="infocell" style="text-align: center;border-left:1px black solid">
                                             <fmt:formatDate type = "date" value = "${s.dob}" />
                                        </td>
                                        <td class="infocell" style="text-align: center;border-left:1px black solid">${s.email}</td>
                                   </tr>
                              </c:forEach>
                         </tbody>
                    </table>
               </c:if>                                                  
          </div>
     </div>
</body>

</html>
