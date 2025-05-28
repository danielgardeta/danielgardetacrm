<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="cercador.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Lista de Clientes</title>
        <link href="cercador.css?v=123" rel="stylesheet" type="text/css"/>
        <style>

        </style>
    </head>
    <body>

        <h1>Clientes Registrados</h1>

       
        <form action="tablaClientes.jsp" method="get" style="margin-bottom: 20px;">
            <label for="buscar">Buscar cliente:</label>
            <input type="text" id="buscar" name="buscar" placeholder="Nombre, Apellido, Email, Empresa..."
                   value="<%= request.getParameter("buscar") != null ? request.getParameter("buscar") : ""%>" />
            <button type="submit">Buscar</button>
        </form>

        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Teléfono</th>
                <th>Email</th>
                <th>Empresa</th>
                <th>Notas</th>
                <th>Opciones</th>
            </tr>

            <%
                String buscar = request.getParameter("buscar");

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/crm_db", "root", "");

                    String sql;
                    PreparedStatement ps;

                    if (buscar != null) {
                        sql = "SELECT * FROM clientes WHERE nombre LIKE ? OR apellido LIKE ? OR email LIKE ? OR empresa LIKE ?";
                        ps = conn.prepareStatement(sql);
                        String igual = "%" + buscar + "%";
                        ps.setString(1, igual);
                        ps.setString(2, igual);
                        ps.setString(3, igual);
                        ps.setString(4, igual);
                    } else {
                        sql = "SELECT * FROM clientes";
                        ps = conn.prepareStatement(sql);
                    }

                    ResultSet rs = ps.executeQuery();
                    boolean Resultados = false;

                    while (rs.next()) {
                        Resultados = true;
            %>
            <tr>
                <td><%= rs.getInt("id")%></td>
                <td><%= rs.getString("nombre")%></td>
                <td><%= rs.getString("apellido")%></td>
                <td><%= rs.getString("telefono")%></td>
                <td><%= rs.getString("email")%></td>
                <td><%= rs.getString("empresa")%></td>
                <td><%= rs.getString("notas")%></td>
                <td>
                    <a href="editar.jsp?id=<%= rs.getInt("id")%>">Editar</a>
                    <a href="remove.jsp?id=<%= rs.getInt("id")%>" onclick="return confirm('¿Estás seguro de que deseas borrar este cliente?');">Eliminar</a>
                </td>
                </td>
            </tr>
            <%
                }

                if (!Resultados) {
            %>
            <tr>
                <td colspan="8" >No se encontraron clientes.</td>
            </tr>
            <%
                }

                rs.close();
                ps.close();
                conn.close();

            } catch (Exception e) {
            %>
            <tr><td colspan="8" style="color:red;">Error al conectar con la base de datos: <%= e.getMessage()%></td></tr>
            <%
                }
            %>
        </table>

    </body>
</html>
