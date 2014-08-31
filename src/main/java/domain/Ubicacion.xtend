package domain

import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable

@Observable
class Ubicacion extends Entity {
	@Property String descripcion
	@Property Integer nivel

	new(String descrip, Integer nvl){
		descripcion=descrip
		nivel=nvl
	}

	def getDescripcionEntera() {
		descripcion.concat(" - Nivel ").concat(nivel.toString)
	}

	override def toString() {
		descripcionEntera
	}
}
