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
        <input type="button" value="Dar de alta" onclick="enviar('formularioEquipos.jsp')">
   </form>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/futbol","root", "root");
      Statement s = conexion.createStatement();

      ResultSet listado = s.executeQuery ("SELECT * FROM equipos");
    %>
    <table>
      <tr><th>Código</th><th>Nombre</th><th>Liga</th><th>Fundación</th><th>Localidad</th><th>Imagen</th></tr>
    <%
      while (listado.next()) {
          out.println("<tr><td>");
          out.println(listado.getString("codEquipo") + "</td>");
          out.println("<td>" + listado.getString("nombre") + "</td>");
          out.println("<td>" + listado.getString("liga") + "</td>");
          out.println("<td>" + listado.getString("fundacion") + "</td>");
          out.println("<td>" + listado.getString("localidad") + "</td>");
          out.println("<td><img src=\"img/" + listado.getString("imagen") + "\"></td>");
    %>
      <td>
        
      <form method="get" action="borraEquipos.jsp">
        <input type="hidden" name="codigo" value="<%=listado.getString("codEquipo") %>"/>
        <input type="submit" value="borrar">
      </form>
      </td></tr>
    <%
      } // while   
      conexion.close();
     %>
    </table>
  </body>
</html>
