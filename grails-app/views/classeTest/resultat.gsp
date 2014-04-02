<html>
<head>
	<title> Test de récupération de données </title>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.css" />
</head>

<body>
 <h1>Résultats</h1>

		<div id="map" style="height: 500px; width : 800px" ></div>
		<script src="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.js"></script>
		<script>
			// Initialiser la carte sur les coordonnées géographiques de Nantes
			var map = L.map('map').setView([47.213, -1.554], 16);

			// Ajouter une couche OSM sur la carte qu'on a initialisée
			L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
				//maxZoom: 18,
				// attribution  : 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>'
			}).addTo(map);

			marker1 = L.marker([${depart_lat},${depart_lng}]);
			map.addLayer(marker1);
			marker1.bindPopup("Point de départ");			
			
			marker2 = L.marker([${arrivee_lat},${arrivee_lng}]);
			map.addLayer(marker2);
			marker2.bindPopup("Point d'arrivée");
				
 		 </script>

<p> 
Point de départ : (${depart_lat},${depart_lng}) <br/>
et <br/>
Point d'arrivée : (${arrivee_lat},${arrivee_lng}) <br/>
Distance : ${distance}
</p>


<g:form controller="ClasseTest">
    <g:actionSubmit value="retour" action="index"/>
</g:form>

</body>
</html>