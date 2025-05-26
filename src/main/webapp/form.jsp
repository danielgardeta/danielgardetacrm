<%-- 
    Document   : pr
    Created on : 24 abr 2025, 14:39:21
    Author     : d.gardeta
--%>


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link href="cercador.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos Cliente</title>
    </head>
    <body>
    <body>

        <h1>Registro de Cliente</h1>

        <form action="form.jsp" method="post">
            <input type="text" name="nombre" placeholder="Nombre" required>
            <input type="text" name="apellido" placeholder="Apellido" required>
            <input type="tel" name="telefono" placeholder="Teléfono" required>
            <input type="email" name="email" placeholder="Correo electrónico" required>
            <input type="text" name="empresa" placeholder="Empresa">
            <textarea name="notas" placeholder="Notas o comentarios adicionales" rows="4" ></textarea>
            <input type="submit" name="submit" value="Guardar">
           <p><a href='tablaClientes.jsp'>Ver tabla de clientes</a></p>
        </form>
        <%

            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String telefono = request.getParameter("telefono");
            String email = request.getParameter("email");
            String empresa = request.getParameter("empresa");
            String notas = request.getParameter("notas");
            String submit = request.getParameter("submit");

            if (submit != null && nombre != null && apellido != null && telefono != null && email != null) {
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    String baseDades = "jdbc:mysql://localhost/crm_db";
                    String usuari = "root", contrasenya = "";
                    Connection c = DriverManager.getConnection(baseDades, usuari, contrasenya);

                    String sql = "INSERT INTO clientes (nombre, apellido, telefono, email, empresa, notas) VALUES (?, ?, ?, ?, ?, ?)";
                    PreparedStatement ps = c.prepareStatement(sql);
                    ps.setString(1, nombre);
                    ps.setString(2, apellido);
                    ps.setString(3, telefono);
                    ps.setString(4, email);
                    ps.setString(5, empresa);
                    ps.setString(6, notas);

                    int filas = ps.executeUpdate();

                    if (filas > 0) {
                        out.println("<p style='color:green;'>Registro guardado correctamente.</p>");
                        
                        
                    } else {
                        out.println("<p style='color:red;'>Error al guardar el registro.</p>");
                    }
                    
                    

                    ps.close();
                    c.close();
                } catch (ClassNotFoundException cnfe) {
                    out.println("<p style='color:red;'>No se encontró el driver JDBC.</p>");
                } catch (SQLException ex) {
                    out.println("<p style='color:red;'>Error SQL: " + ex.getMessage() + "</p>");
                }
            }
            

        %>
        
    </body>


</html>
