package ui

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.layout.ColumnLayout
import domain.Nota

class EditarNotaWindow extends Dialog<Nota> {

	new(WindowOwner parent, Nota model) {
		super(parent, model)
	}

	override def createMainTemplate(Panel mainPanel) {
		title = "Editar nota"
		taskDescription = ""
		super.createMainTemplate(mainPanel)
	}

	override protected createFormPanel(Panel mainPanel) {
		val panel1 = new Panel(mainPanel)
		panel1.setLayout(new ColumnLayout(2))
		new Label(panel1).setText("Fecha:")
		new TextBox(panel1).setWidth(77).bindValueToProperty("fecha")

		val panel2 = new Panel(mainPanel)
		panel2.setLayout(new ColumnLayout(2))
		new Label(panel2).setText("Descripción:")
		new TextBox(panel2).setWidth(145).bindValueToProperty("descripcion")

		val panel3 = new Panel(mainPanel)
		panel3.setLayout(new ColumnLayout(2))
		new CheckBox(panel3).bindValueToProperty("aprobado")
		new Label(panel3).setText("Aprobado")
	}

}
