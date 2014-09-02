package domain

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.UserException

@Observable
class Nota extends Entity implements Cloneable {
	@Property String fecha
	@Property String descripcion
	@Property Boolean aprobado

	/*new(String fecha2, String desc, Boolean aprob) {
		fecha = fecha2
		descripcion = desc
		aprobado = aprob
		
	}*/
	def static new2(String fech, String descrip, Boolean boleano) {
		var nota = new Nota
		nota.descripcion = descrip
		nota.fecha = fech
		nota.aprobado = boleano
		return nota
	}

	def clonar() {
		return this.clone() as Nota
	}

	def copiarA(Nota destino) {
		destino.fecha = fecha
		destino.descripcion = descripcion
		destino.aprobado = aprobado
	}

	def validate() {
		validateFecha
		validateDescripcion
		validateAprobado
	}

	def validateAprobado() {
		if (aprobado == null) {
			throw new UserException("Seleccione estado de la nota")
		}
	}

	def validateFecha() {
		validateLargo
		validateFormato
	}
	
	def validateFormato() {
		if((!fecha.substring(2,3).equals("/"))||(!fecha.substring(5,6).equals("/"))){
			throw new UserException("Formato de fecha invalida, intente con DD/MM/AAAA")
		}  
	}
	
	def validateLargo() {
		if(fecha.length != 10){
			throw new UserException("Formato de fecha invalida, intente con DD/MM/AAAA")
		}  
	}

	def validateDescripcion() {
		if ((descripcion == null) || (descripcion.empty)) {
			throw new UserException("Ingrese descripción")
		}
	}

	def initialize() {
		/*descripcion = ""
		aprobado = false
		fecha = ""*/
	}

}
