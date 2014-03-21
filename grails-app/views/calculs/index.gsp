<html>
	<head>
		<title>Projets en cours</title>
		<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.css" />
	</head>
	
	<body>

		<h1>Projets en cours</h1>
		<table> 
    		<tr> 
    			<th> Nom du projet</th>
        		<th> Responsable du projet </th>
        		<th> Description </th>
        		<th> Date </th>
    		</tr>
    		
			<g:each in="${tousProjets}" status="i" var="ceProjet" >

    		<tr> 
    			<td> ${ceProjet.name } </td>
    			<td> ${ceProjet.owner } </td>
    			<td> ${ceProjet.description } </td>
    			<td> ${ceProjet.dueDate } </td>
			</tr>
  			</g:each>

		</table>
		<h1> Première carte</h1>

		<script src="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.js"></script>
		 <div id="map" style="height: 300px; width : 500px" ></div>
		 <script>
		 //Coordonnées géographiques de Nantes
		 var map = L.map('map').setView([47.217, -1.542], 14);
		 
		 L.tileLayer('http://{s}.tile.cloudmade.com/BC9A493B41014CAABB98F0471D759707/997/256/{z}/{x}/{y}.png', {
			maxZoom: 18,
			// attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://cloudmade.com">CloudMade</a>'
		}).addTo(map);
		
		// Afficher les coordonées d'un clic
		var popup = L.popup();
		var marker=L.marker([0,0]).addTo(map);
		
		function onMapClick(e) {
		popup
			.setLatLng(e.latlng)
			.setContent(e.latlng.toString())
			.openOn(map);
			
		// var marker = L.marker(e.latlng).addTo(map);
		marker.setLatLng(e.latlng)
		}

		map.on('click', onMapClick);
		
		
		</script>
		
	</body>
</html>