package ui

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.layout.ColumnLayout
import domain.Nota
import org.uqbar.arena.widgets.Button

class EditarNotaWindow extends Dialog<Nota> {

	Nota original

	new(WindowOwner parent, Nota model) {
		super(parent, model)

		original = model.clonar

	}

	override protected void addActions(Panel actions) {

		new Button(actions).setCaption("Aceptar").onClick[|this.accept].setAsDefault.disableOnError

		new Button(actions).setCaption("Cancelar").onClick [ |
			original.copiarA(this.modelObject)
			this.cancel
		]
	}

	override protected createFormPanel(Panel mainPanel) {
	title="Nota"
		widgetFechaYDescripcion(mainPanel)

		val panel3 = new Panel(mainPanel)
		panel3.setLayout(new ColumnLayout(3))
		new CheckBox(panel3).bindValueToProperty("aprobado")
		new Label(panel3).setText("Aprobado")
	}

	def widgetFechaYDescripcion(Panel mainPanel) {
		val panel1 = new Panel(mainPanel)
		panel1.setLayout(new ColumnLayout(2))
		new Label(panel1).setText("Fecha:")
		new TextBox(panel1).setWidth(77).bindValueToProperty("fecha")

		val panel2 = new Panel(mainPanel)
		panel2.setLayout(new ColumnLayout(2))
		new Label(panel2).setText("Descripción:")
		new TextBox(panel2).setWidth(145).bindValueToProperty("descripcion")
	}

}
