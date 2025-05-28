<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String idStr = request.getParameter("id");
    if (idStr != null) {
        try {
            int id = Integer.parseInt(idStr);
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/crm_db", "root", "");

            String sql = "DELETE FROM clientes WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            response.sendRedirect("tablaClientes.jsp");
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        }
    } else {
        response.sendRedirect("tablaClientes.jsp");
    }
%>
