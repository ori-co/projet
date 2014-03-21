package test

class CalculsController {

    def index = {
		def allProjects = Calculs.list()
		
		[tousProjets:allProjects]
	}
}
