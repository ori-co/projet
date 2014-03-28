package test

class CalculsController {
	def scaffold = true; 
	
    def index = {
		def allProjects = Calculs.list()
		
		[tousProjets:allProjects]
	}
}
