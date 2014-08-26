package ui

import org.uqbar.arena.Application
import dominio.Materia
import dominio.Carrera
import home.HomeMaterias
import org.uqbar.commons.utils.ApplicationContext
//import org.uqbar.arena.windows.Window

class VentanaMateria extends Application{
	
	override protected createMainWindow() {
		val carrera =new Carrera
		ApplicationContext.instance.configureSingleton(typeof(Materia),new HomeMaterias)
		return new ImageneMaterias(this, carrera)
	}
	
	static def main(String[] args) {
		new VentanaMateria().start
	}
}
	