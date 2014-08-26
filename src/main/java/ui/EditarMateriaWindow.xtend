package ui

import dominio.Materia
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button

class EditarMateriaWindow extends Dialog<Materia>{
	
	new(WindowOwner ownwer, Materia model){
		super(ownwer,model)
	}
	
	override protected createFormPanel(Panel mainPanel){
		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)

		new Label(form).text = "Nombre:"
		val txtNombre = new TextBox(form)
		txtNombre.width = 500
		txtNombre.bindValueToProperty("nombre")
		
		}

override protected void addActions(Panel actions) {
		new Button(actions).setCaption("Aceptar").onClick [ |
			this.accept
		].setAsDefault.disableOnError

		new Button(actions) //
		.setCaption("Cancelar").onClick[|this.cancel]
	}
	
	
}