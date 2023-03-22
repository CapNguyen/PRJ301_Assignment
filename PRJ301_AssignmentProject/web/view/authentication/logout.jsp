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
     <body>
          <jsp:include page="login.jsp"/>
          <script>
               alert("You've logout !");
          </script>
     </body>
</html>
