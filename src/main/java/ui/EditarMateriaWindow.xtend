package ui

import dominio.Materia
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Button
import org.uqbar.commons.utils.ApplicationContext
import home.HomeMaterias
import org.uqbar.arena.aop.windows.TransactionalDialog
import org.uqbar.commons.utils.TransactionalAndObservable
@TransactionalAndObservable

class EditarMateriaWindow extends TransactionalDialog<Materia>{
	
	//Materia mater 
	
	new(WindowOwner ownwer, Materia model){
		super(ownwer,model)
		this.delegate.setErrorViewer(this)
		//mater=model.clone() as Materia
		
	}
	
	override protected createFormPanel(Panel mainPanel){
		val form = new Panel(mainPanel)
		form.layout = new ColumnLayout(1)

		new Label(form).text = "Nombre:"
		val txtNombre=new TextBox(form)
		txtNombre.width=200
		txtNombre.bindValueToProperty("nombreMateria")
		
		this.addBotones(form)
		
		}
	
	def addBotones(Panel actions) {
		new Button(actions).setCaption("Aceptar").onClick [ |
			this.accept
		].setAsDefault.disableOnError

		new Button(actions) 
		.setCaption("Cancelar").onClick[|this.cancel]
	}

override def accept() {
	HomeMaterias.instance.actualizar(this.modelObject)
	super.accept
}
	
	


}