package home

import org.uqbar.commons.model.CollectionBasedHome
import dominio.Materia
import org.apache.commons.collections15.Predicate
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.TransactionalAndObservable
import org.uqbar.commons.utils.Observable

@TransactionalAndObservable
class HomeMaterias extends CollectionBasedHome<Materia>{
	private static HomeMaterias instance= null
	
	@Property List<Materia> materias
	
	new(){ 
		materias= new ArrayList<Materia>
		init()
	}
	
	def void init() {
		this.crear("Arquitectura")
		this.crear("Ingenieria Y Sociedad")
		this.crear("Fisica 1")
		this.crear("Química")
		this.crear("Legislación")
	}
	
	def void crear(String nombreMateria){
		var materia=new Materia
		materia.nombreMateria=nombreMateria
		this.create(materia)
		materias.add(materia)
		
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
	
	def search(String nombre) {
		allInstances.filter[materia|this.match(materia.nombreMateria)].toList
	}
	
	def match(String nombre) {
		nombre.toString().toLowerCase().contains(nombre.toString().toLowerCase())
	}

static def getInstance(){
	if (instance==null){
		instance=new HomeMaterias
	}
	instance
}
	
	def actualizarMaterias(Materia materia) {
		if (!materias.contains(materia)){
		}
		println("Ahora materia tiene:" + materias)
		
	}
	
	def actualizarAbonado(Materia materia) {
			materias.add(materia)
		println("Ahora materias tiene:" + materias)
	}
	
	def List<Materia> getAbonados(Materia materia) {
		materias.toList
	}
	
	def actualizar(Materia materia) {
		
	}

	
	
}