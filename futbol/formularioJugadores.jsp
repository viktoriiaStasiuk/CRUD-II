<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="estilosFormJug.css" />
  <script language="javascript" type="text/javascript">
        function enviar(pagina){
        document.jugadores.action = pagina;
        document.jugadores.submit();
        }
</script>
  </head>
  <body>
<div id="stylized" class="myform">

      <h1>Datos del jugadores</h1>
<p>Datos personales:</p>
       <form name="form" method="get" action="grabaJugadores.jsp" onsubmit="return validar()">
           <label>NumeroID <input type="text" name="numeroID" required=""/></label><br/>
           <label>Nombre <input type="text" name="nombre" required=""/></label><br/>
      <label>Equipo <select id="equipo" name ="equipo" required="">
	<option value="0">--Elige nombre</option>
	<option value="1111">Real Madrid</option>
	<option value="1112">Barcelona</option>
	<option value="1113">Atlético de Madrid</option>
        <option value="1114">Valéncia</option>
	<option value="1115">Athletic Club</option>
	<option value="1116">Sevilla</option>
	<option value="1117">Espanyol</option>
        <option value="1118">Real Sociedad</option>
	<option value="1119">Real Zaragoza</option>
	<option value="1120">Betis</option>
        <option value="1121">Deportivo de la Coruña</option>
	<option value="1122">Celta de Vigo</option>
	<option value="1123">Valladoid</option>
	<option value="1124">Racing de Santander</option>
        <option value="1125">Sporting de Gijón</option>
	<option value="1126">Osasuna</option>
	<option value="1127">Real Oviedo</option>
        <option value="1128">Mallorca</option>
	<option value="1129">Las Palmas</option>
	<option value="1131">Málaga</option>
       </select></label><br/>
      <input type="submit" value="Aceptar">
    </form>
   <form name="jugadores" action="" method="post">
        <input type="button" value="<< Volver a jugadores" onclick="enviar('pideNumeroJugadores.jsp')">
<div class="spacer"></div>
</form>

</div>
  </body>
</html>
