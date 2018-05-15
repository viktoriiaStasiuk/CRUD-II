<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="estilosForm.css" /> 
  <script language="javascript" type="text/javascript">
        function enviar(pagina){
        document.equipo.action = pagina;
        document.equipo.submit();
        }
</script>
    <title>Equipos de futbol</title>
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "root");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      String consultaNumEquipo = "SELECT * FROM equipos WHERE codEquipo="
                                + Integer.valueOf(request.getParameter("codEquipo"));      
      
      ResultSet numeroDeEquipos = s.executeQuery(consultaNumEquipo);
      numeroDeEquipos.last();
      
      if (numeroDeEquipos.getRow() != 0) {
        out.println("Lo siento, no se ha podido dar de alta, ya existe un equipo con el número "
                    + request.getParameter("codEquipo") + ".");
      } else {
        String insercion = "INSERT INTO equipos VALUES (" + Integer.valueOf(request.getParameter("codEquipo"))
                           + ", '" + request.getParameter("nombre")
                           + "', " + Integer.valueOf(request.getParameter("liga"))
                           + ", " + Integer.valueOf(request.getParameter("fundacion"))
                           + ", '" + request.getParameter("localidad") 
                           + "', '" + request.getParameter("foto") 
                           + "')";
        s.execute(insercion);
        out.println("Equipo dado de alta correctamente");
      }
      conexion.close();
    %>
<form name="equipo" action="" method="post">
    <input type="button" value="<< Dar de alta otro equipo" onclick="enviar('formularioEquipos.jsp')">
</form>
  </body>
</html>
