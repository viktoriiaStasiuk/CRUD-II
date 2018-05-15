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
<script language="javascript" type="text/javascript">
        function enviar(paginaa){
        document.inicio.action = paginaa;
        document.inicio.submit();
        }
        function enviar(pagina){
        document.nombreDelFormulario.action = pagina;
        document.nombreDelFormulario.submit();
}
</script>
  </head>
  <body>
   <form name="inicio" action="" method="post">
        <input type="button" value="<< Inicio" onclick="enviar('index.html')">
   </form>
   <form name="nombreDelFormulario" action="" method="post">
        <input type="button" value="Dar de alta" onclick="enviar('formularioJugadores.jsp')">
   </form>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "root");
      Statement s = conexion.createStatement();

      ResultSet listado = s.executeQuery ("SELECT * FROM jugadores");
    %>
    <table>
      <tr><th>NumeroID</th><th>Nombre</th><th>Equipo</th></tr>
    <%
      while (listado.next()) {
          out.println("<tr><td>");
          out.println(listado.getString("numeroID") + "</td>");
          out.println("<td>" + listado.getString("nombre") + "</td>");
          int codEquipo = Integer.parseInt(listado.getString("codEquipo"));
          
          String consultaEquipo = ("SELECT * FROM equipos WHERE codEquipo=" + codEquipo);
          Statement s2 = conexion.createStatement();
          ResultSet nomEquipo = s2.executeQuery (consultaEquipo); 
          nomEquipo.next();
          out.println("<td>" + nomEquipo.getString("nombre") + "</td>");
          
    %>
      <td>
        
      <form method="get" action="borraJugadores.jsp">
        <input type="hidden" name="codigo" value="<%=listado.getString("numeroID") %>"/>
        <input type="submit" value="borrar">
      </form>
        <form method="get" action="modificaJugador.jsp">
        <input type="hidden" name="numeroID" value="<%=listado.getString("numeroID") %>"/>
        <input type="hidden" name="nombre" value="<%=listado.getString("nombre") %>"/>
        <input type="hidden" name="codEquipo" value="<%=listado.getString("codEquipo") %>"/>
        <input type="submit" value="modificar">
      </form>
      
      </td></tr>
    <%
      } // while   

     %>
    </table>
  </body>
</html>

