package dominio

import org.uqbar.commons.utils.Observable
import java.util.List
import java.util.ArrayList
import home.HomeMaterias

@Observable
class Carrera {
	@	Property List<Materia> materias
	//new(){
		//materias= new ArrayList
	//}
	def agregarMaterias(Materia materia){materias.add(materia)}
	//get mATERIAS? 
	//def getMaterias(){ materias}
}