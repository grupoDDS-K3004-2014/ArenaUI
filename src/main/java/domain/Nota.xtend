package domain

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

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
	def static new2(String fech,String descrip, Boolean boleano) {
		var nota = new Nota
		nota.descripcion = descrip
		nota.fecha = fech
		nota.aprobado=boleano
		return nota
	}

	
	def clonar(){
		return this.clone() as Nota
	}
	
	def copiarA(Nota destino) {
		destino.fecha=fecha
		destino.descripcion=descripcion
		destino.aprobado=aprobado
	}
	
}
