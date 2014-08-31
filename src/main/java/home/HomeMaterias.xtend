package home

import domain.Materia
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.CollectionBasedHome
import java.util.List
import org.apache.commons.collections15.Predicate;
import org.uqbar.commons.model.UserException

import java.util.ArrayList
import domain.Nota
import domain.Ubicacion

@Observable
class HomeMaterias extends CollectionBasedHome<Materia> {

	new() {
		this.init
	}

	def void init() {
		var notas = new ArrayList
		notas.add(new Nota("20/10/2014", "1 Parcial", true))
		this.create("Algoritmos", "2004", false, "Sarlanga", "1c", notas,new Ubicacion("2do cuatrimestre", 1))
		notas = new ArrayList
		notas.add(new Nota("30/12/2099", "Tp", true))
		this.create("Fisica II", "2011", true, "Monzón", "A", notas,new Ubicacion("1er cuatrimestre", 1))
	}

	def void create(String nombreMateria, String añoCursada2, Boolean finalAprobado2, String profesor2,
		String ubicacion2, ArrayList<Nota> notas2,Ubicacion ubicacion) {
		var materia = new Materia
		materia.nombre = nombreMateria
		materia.añoCursada = añoCursada2
		materia.finalAprobado = finalAprobado2
		materia.profesor = profesor2
		materia.ubicacion = ubicacion2
		materia.notas = notas2
		this.create(materia)
	}

	override void validateCreate(Materia materia) {
		materia.validate()
		this.validarMateriasDuplicadas(materia)
	}

	def validarMateriasDuplicadas(Materia materia) {
		val lista = allInstances.filter[materia2|this.match(materia.nombre, materia2.nombre)].toList
		if (!lista.isEmpty) {
			throw new UserException("Ya existe una materia con el nombre " + materia.nombre)
		}
	}

	def match(Object expectedValue, Object realValue) {
		if (expectedValue == null) {
			return true
		}
		if (realValue == null) {
			return false
		}
		realValue.toString().toLowerCase().contains(expectedValue.toString().toLowerCase())
	}

	override def Predicate<Materia> getCriterio(Materia example) {
		null
	}

	override createExample() {
		new Materia
	}

	override getEntityType() {
		typeof(Materia)
	}

	def List<Materia> getMaterias() {
		allInstances
	}

}
