<html>
<head>
	<title> Test de récupération de données </title>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.css" />
</head>

<body>
 <h1>Selectionner les points de depart et d'arrivée sur la carte</h1>

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
			
				
			// Définition des fonctions associées aux clics
			var onMapClick1 = function(e) {			
				// Définir des nouvelles coordonnées pour le marqueur de point de départ
				marker1 = L.marker(e.latlng);  //peut etre {draggable:true} ?
				map.addLayer(marker1);
				marker1.bindPopup("Point de départ");
				point_depart = marker1.getLatLng();
				
				// appeler le deuxième script
				map.removeEventListener('click', onMapClick1, false);
				map.addEventListener('click', onMapClick2, false);

				document.getElementById("dep_lat").setAttribute("value",point_depart.lat);
				document.getElementById("dep_lng").setAttribute("value",point_depart.lng);
			}

			var onMapClick2 = function(e) {
				// Définir des nouvelles coordonnées pour le marqueur de point d'arrivée
				marker2 = L.marker(e.latlng); // peut etre {draggable:true} ?
				map.addLayer(marker2);
				marker2.bindPopup("Point d'arrivée");
				point_arrivee = marker2.getLatLng();
				
				map.removeEventListener('click', onMapClick2, false);

				document.getElementById("arr_lat").setAttribute("value",point_arrivee.lat);
				document.getElementById("arr_lng").setAttribute("value",point_arrivee.lng);
			}
			
			map.addEventListener('click', onMapClick1, false);		
			var marker1;
			var marker2;
			var point_depart;
			var point_arrivee;

 		 </script>

<g:formRemote name="valider_form" url="[controller:'ClasseTest', action:'resultat']">
Depart :<br/>
  Latitude : <input id="dep_lat" type="text" name="dep_lat" /> Longitude : <input id="dep_lng" type="text" name="dep_lng" /> <br/>
Arrivée :<br/>
  Latitude : <input id="arr_lat" type="text" name="arr_lat" /> Longitude : <input id="arr_lng" type="text" name="arr_lng" /> <br/>
  <input type="submit" value="OK" />
</g:formRemote>

<g:form controller="ClasseTest">
    <g:actionSubmit value="Retour" action="index"/>
</g:form>


</body>
</html>