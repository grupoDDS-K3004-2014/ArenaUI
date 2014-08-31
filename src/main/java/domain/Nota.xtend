package domain

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@Observable
class Nota  extends Entity implements Cloneable{
	@Property String fecha
	@Property String descripcion
	@Property Boolean aprobado

	new(String fecha2, String desc, Boolean aprob) {
		fecha = fecha2
		descripcion = desc
		aprobado = aprob
		
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
