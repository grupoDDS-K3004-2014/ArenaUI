package ui

import org.uqbar.arena.windows.WindowOwner
import domain.Nota
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label

class CrearNotaWindow extends EditarNotaWindow {

	new(WindowOwner parent, Nota model) {
		super(parent, model)
	}

	override executeTask() {
		super.executeTask()
	}

	override protected createFormPanel(Panel mainPanel) {
		title = "Agregar nota"
		widgetFechaYDescripcion(mainPanel)

		val panel3 = new Panel(mainPanel)
		panel3.setLayout(new ColumnLayout(3))
		new CheckBox(panel3).bindValueToProperty("aprobado")
		new Label(panel3).setText("Aprobado")
	}
}
