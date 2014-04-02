package test

class ClasseTestController {

    def index= {
		// Méthode de test pour récupérer des variables de la view

	}
	
	def resultat ={

		def depart_lat =params.dep_lat;
		def depart_lng =params.dep_lng;
		def arrivee_lat =params.arr_lat;
		def arrivee_lng =params.arr_lng;
	
		def distance = 77
		 println params;
		 // point de depart et d'arrivée, lat et lng et distance mini
		 [depart_lat:depart_lat,depart_lng:depart_lng,arrivee_lat:arrivee_lat,arrivee_lng:arrivee_lng ,distance:distance]
		 }
	
}
