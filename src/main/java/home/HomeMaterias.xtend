package home

import org.uqbar.commons.model.CollectionBasedHome
import dominio.Materia
import org.apache.commons.collections15.Predicate
import org.uqbar.commons.utils.Observable

@Observable

class HomeMaterias extends CollectionBasedHome<Materia>{
	
	new(){ this.init}
	
	def void init() {
		this.crear("Arquitectura")
		this.crear("Ingenieria Y Sociedad")
		this.crear("Fisica 1")
		this.crear("Qumica")
		this.crear("Legislacion")
	}
	
	def void crear(String nombreMateria){
		var materia=new Materia
		materia.nombre=nombreMateria
		this.create(materia)
		
	}

override def Class<Materia> getEntityType(){
	typeof(Materia)
}

override createExample(){
	new Materia
}

override protected Predicate<Materia> getCriterio(Materia example) {
        null
    }
}