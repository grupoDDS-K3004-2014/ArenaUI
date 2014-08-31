package runnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import org.uqbar.commons.utils.ApplicationContext
import domain.Materia
import home.HomeMaterias

class WindowApplication extends Application {

	static def void main(String[] args) {
		new WindowApplication().start()
	}

	override protected Window<?> createMainWindow() {
		ApplicationContext.instance.configureSingleton(typeof(Materia), new HomeMaterias)
		return new ui.VentanaPrincipal(this)
	}
}
