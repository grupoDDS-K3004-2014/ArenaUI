package ui

import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.utils.ApplicationContext
import domain.Materia
import home.HomeMaterias

class CrearMateriaWindow extends Dialog<Materia> {

	new(WindowOwner parent) {
		super(parent, Materia.initialize)
	}

	override def createMainTemplate(Panel mainPanel) {
		title = "Agregar materia"
		taskDescription = "Ingrese el nombre de la nueva materia"
		super.createMainTemplate(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {

		new TextBox(mainPanel).bindValueToProperty("nombre")

	}

	override executeTask() {
		homeMaterias.create(modelObject)
		super.executeTask()
	}

	override protected void addActions(Panel actions) {

		new Button(actions).setCaption("Aceptar").onClick[|this.accept].setAsDefault.disableOnError

		new Button(actions).setCaption("Cancelar").onClick[|this.cancel]
	}

	def HomeMaterias getHomeMaterias() {
		ApplicationContext.instance.getSingleton(typeof(Materia))
	}

}
