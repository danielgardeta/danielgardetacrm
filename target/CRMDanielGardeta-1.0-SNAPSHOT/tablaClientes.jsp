<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="cercador.css?v=123" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Clientes</title>

    </head>
    <body>

        <h1>Clientes Registrados</h1>
        <form action="listaClientes.jsp" method="get" style="margin-bottom: 20px;">
    <label for="buscar">Buscar cliente:</label>
    <input type="text" id="buscar" name="buscar" placeholder="Nombre, Apellido, Email..." />
    <button type="submit" name="buscar">Buscar</button>
</form>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String baseDades = "jdbc:mysql://localhost/crm_db";
                String usuari = "root", contrasenya = "";
                Connection c = DriverManager.getConnection(baseDades, usuari, contrasenya);

                String sql = "SELECT * FROM clientes";
                PreparedStatement ps = c.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                out.println("<table>");
                out.println("<tr><th>ID</th><th>Nombre</th><th>Apellido</th><th>Teléfono</th><th>Email</th><th>Empresa</th><th>Notas</th><th>Opciones</th></tr>");

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td class='id-col'>" + rs.getInt("id") + "</td>");
                    out.println("<td>" + rs.getString("nombre") + "</td>");
                    out.println("<td>" + rs.getString("apellido") + "</td>");
                    out.println("<td>" + rs.getString("telefono") + "</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("<td>" + rs.getString("empresa") + "</td>");
                    out.println("<td>" + rs.getString("notas") + "</td>");
                    out.println("<td><a href='editar.jsp?id=" + rs.getInt("id") + "'>Editar</a> | "
    + "<a href='?deleteId=" + rs.getInt("id") + "' onclick='return confirm(\"Borrar este cliente\");'>Eliminar</a></td>");
                    out.println("</tr>");
                    

                }

                out.println("</table>");

                rs.close();
                ps.close();
                c.close();
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
            String submit = request.getParameter("buscar");
            
            if (submit != null ) {
  
            response.sendRedirect("buscar.jsp");
        } 
    
        %>

    </body>
</html>

