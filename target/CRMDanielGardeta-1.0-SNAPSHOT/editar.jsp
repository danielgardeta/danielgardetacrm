<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="cercador.css" rel="stylesheet" type="text/css"/>
<%
    request.setCharacterEncoding("UTF-8");
    String metodo = request.getMethod();
    String idStr = request.getParameter("id");
    String nombre = "", apellido = "", telefono = "", email = "", empresa = "", notas = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost/crm_db", "root", "");

        if ("POST".equalsIgnoreCase(metodo)) {
          
            nombre = request.getParameter("nombre");
            apellido = request.getParameter("apellido");
            telefono = request.getParameter("telefono");
            email = request.getParameter("email");
            empresa = request.getParameter("empresa");
            notas = request.getParameter("notas");

            String sql = "UPDATE clientes SET nombre=?, apellido=?, telefono=?, email=?, empresa=?, notas=? WHERE id=?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, nombre);
            ps.setString(2, apellido);
            ps.setString(3, telefono);
            ps.setString(4, email);
            ps.setString(5, empresa);
            ps.setString(6, notas);
            ps.setInt(7, Integer.parseInt(idStr));
            ps.executeUpdate();
            ps.close();

            response.sendRedirect("tablaClientes.jsp");
            return;
        } else {
            // Mostrar datos actuales
            String sql = "SELECT * FROM clientes WHERE id = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(idStr));
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
        }

        c.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>

<h2>Editar Cliente</h2>
<form method="post">
    <input type="hidden" name="id" value="<%= idStr %>">
    <input type="text" name="nombre" value="<%= nombre %>" required><br><br>
    <input type="text" name="apellido" value="<%= apellido %>" required><br><br>
    <input type="tel" name="telefono" value="<%= telefono %>" required><br><br>
    <input type="email" name="email" value="<%= email %>" required><br><br>
    <input type="text" name="empresa" value="<%= empresa %>"><br><br>
    <textarea name="notas" rows="4"><%= notas %></textarea><br><br>
    <input type="submit" value="Actualizar">
</form>
