package ui

import dominio.Materia
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Label
import home.HomeMaterias

class CrearMateriaWindow extends EditarMateriaWindow {
	
	
	new(WindowOwner owner) {
		super(owner, new Materia)
		this.title="Agregar nueva materia"
	}
	
	//override executeTask(){
		//homeMaterias.create(modelObject)
		//super.executeTask()
		//}
	
	def create(Object object, Materia materia) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	
	override protected createFormPanel(Panel mainPanel) {
		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(2)
		new Label(form).text = "Nombre"
		val txtNombre = new TextBox(form)
		txtNombre.width = 500
		txtNombre.bindValueToProperty("nombreMateria")

	}


	override protected void addActions(Panel actions) {
		new Button(actions).setCaption("Aceptar").onClick [ |
			this.accept
		].setAsDefault.disableOnError

		new Button(actions) //
		.setCaption("Cancelar").onClick[|this.cancel]
	}
	
	
}