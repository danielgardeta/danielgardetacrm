<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="cercador.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Editar Cliente</title>
</head>
<body>

<%
    String idStr = request.getParameter("id");
    int id = Integer.parseInt(idStr);

    String nombre = "";
    String apellido = "";
    String telefono = "";
    String email = "";
    String empresa = "";
    String notas = "";
    String submit= request.getParameter("submit");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String baseDades = "jdbc:mysql://localhost/crm_db";
        String usuari = "root", contrasenya = "";
        Connection c = DriverManager.getConnection(baseDades, usuari, contrasenya);

        String sql = "SELECT nombre, apellido, telefono, email, empresa, notas FROM clientes WHERE id = ?";
        PreparedStatement ps = c.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            nombre = rs.getString("nombre");
            apellido = rs.getString("apellido");
            telefono = rs.getString("telefono");
            email = rs.getString("email");
            empresa = rs.getString("empresa");
            notas = rs.getString("notas");
        }
        rs.close();
        ps.close();
        c.close();

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        return;
    }
%>

<h1>Editar Cliente</h1>
<form action="actualizarCliente.jsp" method="post">
    <input type="text" name="nombre" value="<%= nombre %>" required><br><br>
    <input type="text" name="apellido" value="<%= apellido %>" required><br><br>
    <input type="tel" name="telefono" value="<%= telefono %>" required><br><br>
    <input type="email" name="email" value="<%= email %>" required><br><br>
    <input type="text" name="empresa" value="<%= empresa %>"><br><br>
    <textarea name="notas" rows="4"><%= notas %></textarea><br><br>
    <input type="submit" name ="submit" value="Actualizar">
</form>
    <%
        /*if (submit != null ) {
        String updateSQL = "UPDATE clientes SET nombre=?, apellido=?, telefono=?, email=?, empresa=?, notas=? WHERE id=?";
            PreparedStatement psUpdate = c.prepareStatement(updateSQL);
            psUpdate.setString(1, nombre);
            psUpdate.setString(2, apellido);
            psUpdate.setString(3, telefono);
            psUpdate.setString(4, email);
            psUpdate.setString(5, empresa);
            psUpdate.setString(6, notas);
            psUpdate.setInt(7, id);

            int filas = psUpdate.executeUpdate();
            psUpdate.close();

            if (filas > 0) {
                out.println("<p style='color:green;'>Cliente actualizado correctamente.</p>");
            }
    }*/
        %>

</body>
</html>
