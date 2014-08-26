package dominio

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

//import java.util.Date

@Observable
class Materia extends Entity{
	String nombre
	//Date anioCursada
	//String profesorCursada
	
	//new(String nombre){
		//this.nombre=nombre
	//}
	
	def setNombre(String nombre){
		this.nombre=nombre
	}
	
	def getNombre(){
		nombre
	}
	
	
}