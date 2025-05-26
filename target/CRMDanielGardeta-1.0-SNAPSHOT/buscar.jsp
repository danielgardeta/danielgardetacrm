<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="cercador.css?v=123" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultados de la búsqueda</title>
</head>
<body>

<h2>Resultados de la búsqueda</h2>

<%
    String buscar = request.getParameter("buscar");
    if (buscar == null) buscar = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String baseDades = "jdbc:mysql://localhost/crm_db";
        String usuari = "root", contrasenya = "";
        Connection c = DriverManager.getConnection(baseDades, usuari, contrasenya);

        String sql;
        PreparedStatement ps;

        if (!buscar.isEmpty()) {
            sql = "SELECT * FROM clientes WHERE nombre LIKE ? OR apellido LIKE ? OR email LIKE ?";
            ps = c.prepareStatement(sql);
            String patron = "%" + buscar + "%";
            ps.setString(1, patron);
            ps.setString(2, patron);
            ps.setString(3, patron);
        } else {
            sql = "SELECT * FROM clientes";
            ps = c.prepareStatement(sql);
        }

        ResultSet rs = ps.executeQuery();

        out.println("<table border='1' cellpadding='5' cellspacing='0'>");
        out.println("<tr><th>ID</th><th>Nombre</th><th>Apellido</th><th>Teléfono</th><th>Email</th><th>Empresa</th><th>Notas</th><th>Opciones</th></tr>");

        boolean hayResultados = false;
        while (rs.next()) {
            hayResultados = true;
            out.println("<tr>");
            out.println("<td>" + rs.getInt("id") + "</td>");
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

        if (!hayResultados) {
            out.println("<tr><td colspan='8' style='text-align:center;'>No se encontraron clientes.</td></tr>");
        }

        out.println("</table>");

        rs.close();
        ps.close();
        c.close();

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

</body>
</html>
