package domain

import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.Observable

@Observable
class Ubicacion extends Entity {
	@Property String descripcion
	@Property Integer nivel

	def new2(String descripcion, Integer nivel) {
	}

	def getDescripcionEntera() {
		descripcion.concat(" - Nivel ").concat(nivel.toString)
	}

	override def toString() {
		descripcionEntera
	}

	def static new2(String descripcion, int nivel) {
		var ubicacion = new Ubicacion
		ubicacion.descripcion = descripcion
		ubicacion.nivel = nivel
		return ubicacion
	}

}
