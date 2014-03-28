<html>
<head>
	<meta charset="utf-8" />
	<title> Crétation d'un itinéraire </title>
	<link rel="stylesheet" href="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.css" />

</head>

<body>
		 <h1>Selectionner les points de depart et d'arrivée sur la carte</h1>

		<div id="map" style="height: 500px; width : 800px" ></div>
		<script src="http://cdn.leafletjs.com/leaflet-0.7.2/leaflet.js"></script>
		<script>
			// Initialiser la carte sur les coordonnées géographiques de Nantes
			var map = L.map('map').setView([47.213, -1.554], 16);

			// Ajouter une couche Cloudmade sur la carte qu'on a initialisée
			L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
				//maxZoom: 18,
				// attribution  : 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a>'
			}).addTo(map);

			// Définition des markers 
				var Drapeaux = L.Icon.extend({
				options : {
					iconSize: [38, 38],
					iconAnchor: [1, 37],
					popupAnchor: [19, -24]
					}
				});

				var depart = new Drapeaux({ iconUrl: 'Drapeau-vert.png'}),
					arrivee = new Drapeaux({ iconUrl: 'Drapeau-rouge.png'});

				L.icon = function (options) {
					return new L.Icon(options);
				};

			// Définition des fonctions associées aux clics
			var onMapClick1 = function(e) {			
				// Définir des nouvelles coordonnées pour le marqueur de point de départ
				point_depart = e.latlng;
				
//Commentaire de Clément : Ajout de deux lignes de récuperation des latitudes et longitudes du point de départ.
				point_depart_long=e.latlng.toString().substr(7, 8);
				point_depart_lat=e.latlng.toString().substr(16, 9);
				
				marker1 = L.marker(point_depart,{icon: depart});
				map.addLayer(marker1);
				marker1.bindPopup("Point de départ");

				// appeler le deuxième script
				map.removeEventListener('click', onMapClick1, false);
				map.addEventListener('click', onMapClick2, false);
			}

			var onMapClick2 = function(e) {
				// Définir des nouvelles coordonnées pour le marqueur de point d'arrivée
				point_arrivee = e.latlng;
				
				//Commentaire de Clément : Ajout de deux lignes de récuperation des latitudes et longitudes du point arrivée.
				point_arrivee_long=e.latlng.toString().substr(7, 8);
				point_arrivee_lat=e.latlng.toString().substr(16, 9);
				marker2 = L.marker(point_arrivee,{icon: arrivee});
				map.addLayer(marker2);
				marker2.bindPopup("Point d'arrivée");

				// appeler les troisème script
				map.removeEventListener('click', onMapClick2, false);
				map.addEventListener('click', onMapClick3, false);
			}

			var onMapClick3 = function(e) {
				// Affichage des coordonnées 
				//Commentaire de Clément : cooordonnées des points dans le popup-up
				
				alert(' point de départ a pour longitude '+point_depart_long+'pour latitude '+point_depart_lat+'\n point d\'arrivée : '+point_arrivee_long+' latitude '+point_arrivee_lat);

				// Ré-initialisation de la carte
				map.removeLayer(marker1);
				map.removeLayer(marker2);

				// Rappeler le premier script
				map.removeEventListener('click', onMapClick3, false);
				map.addEventListener('click', onMapClick1, false);
			}

			map.addEventListener('click', onMapClick1, false);		
			var marker1;
			var marker2;
			var point_depart;
			var point_arrivee;

		</script>			
</body>
</html>