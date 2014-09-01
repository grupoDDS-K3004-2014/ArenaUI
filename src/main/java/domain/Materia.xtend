package domain

import java.util.ArrayList
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

@Observable
class Materia extends Entity {

	@Property String nombre
	@Property String añoCursada
	@Property Boolean finalAprobado
	@Property String profesor
	@Property String ubicacion
	@Property ArrayList<Nota> notas = new ArrayList

	def validate() {
		if (!(nombre.toString.length > 5)) {
			throw new UserException("Ingrese un nombre de con mas de 5 caracteres")
		}
	}

	def eliminarNota(Nota nota) {
		val notasAux = new ArrayList()
		notasAux.addAll(notas)
		notasAux.remove(nota)
		notas = notasAux
	}

	def static initialize() {
		var materiaNueva =new Materia
		materiaNueva.añoCursada=""
		materiaNueva.finalAprobado=false
		materiaNueva.profesor=""
		materiaNueva.ubicacion=""
		return materiaNueva
	}

}
