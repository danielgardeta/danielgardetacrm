<%-- 
    Document   : admin
    Created on : 25 may 2025, 20:51:29
    Author     : d.gardeta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="cercador.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="admin.jsp" method="post">
            <input type="text" name="Usuario" placeholder="Usuario" required>
            <input type="password" name="Password" placeholder="Password" required>        
            <input type="submit" name="submit" value="Entrar">
        </form>
    </body>
</html>
<%

    String usuario = request.getParameter("Usuario");
    String Password = request.getParameter("Password");
    String submit = request.getParameter("submit");


    if (submit != null && usuario != null && Password != null) {
        if (usuario.equals("admin") && Password.equals("Cadaques34.")) {
            response.sendRedirect("form.jsp");
        } else {
            
            out.println("<p style='color:red;'>Usuario o contraseña incorrectos</p>");
        }
    }

%>