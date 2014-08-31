package domain

import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@Observable
class Nota  extends Entity{
	@Property String fecha
	@Property String descripcion
	@Property Boolean aprobado

	new(String fecha2, String desc, Boolean aprob) {
		fecha = fecha2
		descripcion = desc
		aprobado = aprob
	}
	
}
