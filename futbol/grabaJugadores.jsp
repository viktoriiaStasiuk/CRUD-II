<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="estilosFormJug.css" /> 
  <script language="javascript" type="text/javascript">
        function enviar(pagina){
        document.jugador.action = pagina;
        document.jugador.submit();
        }
</script>
    <title>Jugadores</title>
  </head>
  <body>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "root");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      String consultaNumJugadores = "SELECT * FROM jugadores WHERE numeroID="
                                + Integer.valueOf(request.getParameter("numeroID"));      
      
      ResultSet numeroDeJugadores = s.executeQuery (consultaNumJugadores);
      numeroDeJugadores.last();
      
      if (numeroDeJugadores.getRow() != 0) {
        out.println("Lo siento, no se ha podido dar de alta, ya existe un jugador con el número "
                    + request.getParameter("numeroID") + ".");
      } else {
        String insercion = "INSERT INTO jugadores VALUES (" + Integer.valueOf(request.getParameter("numeroID"))
                           + ", '" + request.getParameter("nombre")
                           + "', " + request.getParameter("equipo")
                           + ")";
        s.execute(insercion);
        out.println("Jugador dado de alto correctamente");
      }
      conexion.close();
    %>
<form name="jugador" action="" method="post">
    <input type="button" value="<< Dar de alta otro jugador" onclick="enviar('formularioJugadores.jsp')">
</form>
  </body>
</html>