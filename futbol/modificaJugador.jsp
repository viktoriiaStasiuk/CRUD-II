<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://fonts.googleapis.com/css?family=Faster+One" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="estilos.css">
        <title>Modifica</title>
    </head>
    <body>
<% request.setCharacterEncoding("UTF-8"); %>

                <div>
                    <div id="texto">Modifica</div>

                    <form method="get" action="modJug.jsp" class="formulario">
                        <div class="">
                            <input class="" type="text" name="numeroID" placeholder="NumeroID" value="<%= request.getParameter("numeroID")%>" required="">
                            <input class="" type="text" name="nombre" placeholder="Nombre" value="<%= request.getParameter("nombre")%>" required="">
                            <input class="" type="text" name="codEquipo" placeholder="Equipo" value="<%= request.getParameter("codEquipo")%>" required=""><br/>
                            
                            <a href=pideNumeroJugadores.jsp" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>Cancelar</a>
            <button type="submit" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span>Aceptar</button><br><br>
                        </div>
                    </form>
                </div>
           
        </div
    </body>
</html>

