package ui

import dominio.Materia
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.ApplicationContext
import home.HomeMaterias
import org.uqbar.commons.utils.TransactionalAndObservable

@TransactionalAndObservable
class BuscadorMaterias {
	@Property String nombreMateria
	@Property List<Materia> materias
	
	def void search(){
		//refresca grilla con actualizaciones
		materias= new ArrayList<Materia>
		materias=getHomeMaerias().search(nombreMateria)
	}
	
	def HomeMaterias getHomeMaerias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}
	
	}