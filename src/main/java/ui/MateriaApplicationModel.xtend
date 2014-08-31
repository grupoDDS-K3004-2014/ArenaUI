package ui

import org.uqbar.commons.utils.Observable
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import home.HomeMaterias
import java.util.ArrayList
import java.io.Serializable
import domain.Materia
import domain.Nota
import domain.Ubicacion
import home.HomeUbicacion

@Observable
class MateriaApplicationModel implements Serializable {

	@Property List<Materia> materias
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada
	@Property List<Ubicacion> posiblesUbicaciones

	new(){
		super()
		posiblesUbicaciones = new HomeUbicacion().ubicaciones
	}
	

	def void conseguirMaterias() {
		materias = new ArrayList<Materia>
		materias = this.getHomeMaterias().getMaterias()
	}

	def crearMateria(Materia materia) {
		this.getHomeMaterias.create(materia)
		this.conseguirMaterias
	}

	def HomeMaterias getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}

	def void eliminarNotaSeleccionada() {
		materiaSeleccionada.eliminarNota(notaSeleccionada)
		notaSeleccionada = null
	}

	def void agregarNota() {
	}
}
