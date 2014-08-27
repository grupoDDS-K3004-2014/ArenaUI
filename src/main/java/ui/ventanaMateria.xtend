package ui

import org.uqbar.arena.Application
import dominio.Materia
import home.HomeMaterias
import org.uqbar.commons.utils.ApplicationContext


class VentanaMateria extends Application{
	
	override protected createMainWindow() {
		ApplicationContext.instance.configureSingleton(typeof(Materia),new HomeMaterias)
		return new ImageneMaterias(this)
	}
	
	static def main(String[] args) {
		new VentanaMateria().start
	}
}
	