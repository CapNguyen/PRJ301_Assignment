<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
       <head>

              <meta charset="UTF-8">
              <title>Login</title>
              <meta http-equiv="x-ua-compatible" content="ie=edge">
              <meta name="viewport" content="width=device-width, initial-scale=1">
              <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css"/>
       </head>
       <body class="align">

              <div class="grid align__item">
                     <div class="login">
                            <img src="${pageContext.request.contextPath}/img/FPT_logo_2010.svg.png" alt=""/>
                            <form action="login" method="POST" class="form">
                                   <div class="form__field">
                                          <input name="username" type="email" placeholder="Username" >
                                   </div>
                                   <div class="form__field">
                                          <input name="password" type="password" placeholder="********" >
                                   </div>
                                   <div class="form__field">
                                          <select name="campus" class="btn btn-default" required>
                                                 <option selected="selected" value="">Select Campus</option>
                                                 <option value="1">FU-Hoà Lạc</option>
                                                 <option value="2">FU-Hồ Chí Minh</option>
                                                 <option value="3">FU-Đà Nẵng</option>
                                                 <option value="4">FU-Cần Thơ</option>
                                                 <option value="5">FU-Quy Nhơn</option>
                                          </select>
                                   </div>
                                   <div class="form__field">
                                          <input type="submit" value="Login">
                                   </div>
                            </form>
                     </div>
              </div>
              <script>
                     alert("You've logout !");
              </script>
       </body>
</html>
