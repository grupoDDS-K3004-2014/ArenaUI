package dominio

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@	Observable

class Materia extends Entity implements Cloneable{
	@Property String nombreMateria
	//@Property int anio
	//@Property String profesorCursada
	
	
	override clone(){
		super.clone()
	}
	
	def validar() {
	}

	
}

