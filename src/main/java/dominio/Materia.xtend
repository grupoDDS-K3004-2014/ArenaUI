package dominio

import org.uqbar.commons.model.Entity
import org.uqbar.commons.utils.TransactionalAndObservable
import home.HomeMaterias

@TransactionalAndObservable

class Materia extends Entity implements Cloneable{
	@Property String nombreMateria
	
override clone(){
		super.clone()
	}
	
}

