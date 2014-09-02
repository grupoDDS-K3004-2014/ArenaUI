package ui

import org.uqbar.commons.utils.Observable
import java.util.List
import org.uqbar.commons.utils.ApplicationContext
import home.HomeMaterias
import java.util.ArrayList
import java.io.Serializable
import domain.Materia
import domain.Nota

@Observable
class MateriaApplicationModel implements Serializable {

	@Property List<Materia> materias
	@Property List<String> ubicaciones
	@Property Materia materiaSeleccionada
	@Property Nota notaSeleccionada
	@Property ArrayList<Nota> notas

	new() {
		super()
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

	def conseguirUbicaciones() {
		this.ubicaciones = new ArrayList
		ubicaciones.add("1er cuatrimestre - Nivel 1")
		ubicaciones.add("1er cuatrimestre - Nivel 2")
		ubicaciones.add("1er cuatrimestre - Nivel 3")
		ubicaciones.add("2do cuatrimestre - Nivel 1")
		ubicaciones.add("2do cuatrimestre - Nivel 2")
		ubicaciones.add("2do cuatrimestre - Nivel 3")

	}

}
