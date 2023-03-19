<%-- 
    Document   : StudentInfo
    Created on : Mar 17, 2023, 11:58:27 PM
    Author     : admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <title>Student Info</title>
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
                         <a style="margin-left: 20px;" href="../timetable">
                              <h3 style="margin-top: 8px"><strong>Timetable</strong></h3>
                         </a>
                         <h3 style="margin-top: 8px; margin-left: 20px"><strong>| User detail</strong></h3>               
                    </div>
                    <div class="col-md-6" style="margin-left: 600px">
                         <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">          
                              <button style="background-color: #5cb85c; color: white">
                                   <a style="color: white" href="">${s.account.accountName}</a>
                              </button>
                         </c:forEach>
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
               <table style="margin-left: 200px">
                    <tbody>
                         <tr>
                              <td>
                                   <div>
                                        <h2>User detail</h2><br/>
                                        <a href="../AC" style="color: blue; margin-left: 5px">Course attendance</a>
                                   </div>
                                   <table>
                                        <tbody>
                                             <c:forEach items="${requestScope.stu}" var="s" varStatus="loop">
                                                  <tr>
                                                       <td style="width: 450px"><b>Login</b></td>
                                                       <td style="width: 550px; border-bottom: solid lightgray 1px">${s.account.accountName}</td>
                                                  </tr>
                                                  <tr>
                                                       <td style=" border-bottom: solid lightgray 1px"><b>Full name</b></td>
                                                       <td style=" border-bottom: solid lightgray 1px">${s.name}</td>
                                                  </tr>
                                                  <tr>
                                                       <td style=" border-bottom: solid lightgray 1px"><b>Image</b></td>
                                                       <td style=" border-bottom: solid lightgray 1px"> <img style="height: 150px; width: 120px" src="avatar.png" alt="avatar"/></td>
                                                  </tr>
                                                  <tr>
                                                       <td style=" border-bottom: solid lightgray 1px"><b>Email</b></td>
                                                       <td style=" border-bottom: solid lightgray 1px">${s.email}</td>
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
