<!DOCTYPE html>
<html>
<head
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
	        <link href="css_own/style_carousel.css" rel="stylesheet" type="text/css"/>
        <link href="css_own/style.css" rel="stylesheet" type="text/css"/>
        <link href="css_own/style_dashboard.css" rel="stylesheet" type="text/css"/>
</head>
<body>
 <?php echo '<p>Hola Mundo</p>'; ?>

<div class="sidenav">
  <a href="http://localhost/loc/accidente.php">Ingresar accidente</a>
  <a href="http://localhost/loc/confirmaracc.php">Confirmar accidente</a>
    <a href="http://localhost/loc/confirmaracc.php">Volver al inicioo</a>
</div>
<style>

    /* Optional: Makes the sample page fill the window. */
    html, body {
		
        height: 100%;
        margin: 0;
        padding: 0;
    }
 /* Always set the map height explicitly to define the size of the div
 * element that contains the map. */
    #map {
        height: 100%;
		
		
    }
	
	.sidenav {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #DFDEDE;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 6px 6px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
}

.sidenav a:hover {
  color: #CE2A2A;
}

.main {
  margin-left: 200px; /* Same as the width of the sidenav */
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
	
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

