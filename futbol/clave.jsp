
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="estiloPrincipal.css" rel="stylesheet">
    </head>
    <body>
        <%
            HashMap<String, String> login = new HashMap();

            login.put("usuario", "usuario");

            String nombre = request.getParameter("usuario");
            String contrasenia = request.getParameter("password");

            if (login.containsKey(nombre)) {
                if (login.get(nombre).equals(contrasenia)) {
                    session.setAttribute("nombre", nombre);
                    response.sendRedirect("index.html");

                } else {
                    out.println(" ");%>  
        <form name="contrasenia" action="" method="post">
            <input type="button" value="Contraseña incorrecta" onclick="enviar('index1.html')">
        </form><%
            }
        } else {
            %>
        
            <a href="index1.html"><input type="button" value="Usuario incorrecto"></a>
       <%
            }

        %> 

    </body> 
</html>


