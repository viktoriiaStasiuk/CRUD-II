<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilos.css" /> 
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "root");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      String actualizacion = "UPDATE jugadores SET "
                           
                           + "', nombre=" + request.getParameter("nombre")
                           + ", codEquipo=" + Integer.valueOf(request.getParameter("codEquipo"))
              + "' WHERE numeroID=" + Integer.valueOf(request.getParameter("numeroID"));
                           
      s.execute(actualizacion);
      out.println("Jugador actualizado correctamente.");
      
      conexion.close();
    %>
    <br>
    
  <a href="pideNumeroJugadores.jsp"><input type="button" value="Volver"></a>
    
  </body>
</html>


