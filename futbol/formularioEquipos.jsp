<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="estilosForm.css" />
        <script language="javascript" type="text/javascript">
            function enviar(pagina) {
                document.equipos.action = pagina;
                document.equipos.submit();
            }
        </script>
    </head>
    <body>
        <div id="stylized" class="myform">
            <h1>Datos del equipo</h1>
            <p>Datos personales:</p>
            <form name="form" method="get" action="grabaEquipos.jsp" onsubmit="return validar()">
                <label>Código Equipo<input type="text" name="codEquipo" required=""/></label><br/><br/>
                <label>Nombre<input type="text" name="nombre" required=""/></label><br/><br/>
                <label>Liga <input type="text" name="liga" required=""/></label><br/><br/>
                <label>Fundación <input type="text" name="fundacion" required=""/></label><br/>
                <label>Localidad <select id="localidad" name ="localidad" required="">           
                                <%
                                  ArrayList<String> localidad = new ArrayList();
                                  localidad.add("Madrid");
                                  localidad.add("Sevilla");
                                  localidad.add("Valencia");
                                  localidad.add("Barcelona");
                                  localidad.add("Eztremadura");
                                  localidad.add("Santander");
                                  localidad.add("Jaen");
                                  localidad.add("Pais Vasco");
                                  localidad.add("Málaga");
                                  localidad.add("Galicia");
                                  localidad.add("Asturias");
                                  localidad.add("Salamanca");
                                  localidad.add("Murcia");
                                  localidad.add("La Coruña");                                 
                                  localidad.add("Valladolid");
                                  localidad.add("Mallorca");
                                  localidad.add("Murcia");
                        
                                      int cont = 0;
                                      for (String n : localidad) {
                                          cont++;
                                        out.println("<option value="+cont+">" + n + "</option>");
                                      }
                                    %>  

                </label><br/><br/>
                <label>Imagen <input type="file" name ="foto"></label><br/><br/>
                <input type="submit" value="Aceptar">
            </form>
            <form name="equipos" action="" method="post">
                <input type="button" value="<< Volver a equipos" onclick="enviar('pideNumeroEquipos.jsp')">
                <div class="spacer"></div>
            </form>

        </div>
    </body>
</html>
