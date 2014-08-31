package home

import domain.Ubicacion
import java.util.List
import org.uqbar.commons.model.CollectionBasedHome
import org.uqbar.commons.utils.Observable
import org.apache.commons.collections15.Predicate;

@Observable
class HomeUbicacion extends CollectionBasedHome<Ubicacion> {


	new() {
		this.init
	}

	def void init() {
		this.create("1er cuatrimestre", 1)
		this.create("2do cuatrimestre", 1)
		this.create("1er cuatrimestre", 2)
		this.create("2do cuatrimestre", 2)
		this.create("1er cuatrimestre", 3)
	}

	def void create(String descripcion, Integer nivel) {
		var ubicacion = new Ubicacion
		ubicacion.descripcion = descripcion
		ubicacion.nivel = nivel
		this.create(ubicacion)
	}

	def List<Ubicacion> getUbicaciones() {
		allInstances
	}

	def Ubicacion get(String descripcion) {
		ubicaciones.findFirst[ubicacion|ubicacion.descripcion.equals(descripcion)]
	}

	override def Class<Ubicacion> getEntityType() {
		typeof(Ubicacion)
	}

	override def createExample() {
		new Ubicacion()
	}

	override def Predicate<Ubicacion> getCriterio(Ubicacion example) {
		null
	}

}
