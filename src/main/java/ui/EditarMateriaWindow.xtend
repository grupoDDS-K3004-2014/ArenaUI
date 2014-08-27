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
import org.uqbar.commons.utils.Observable

@Observable

class EditarMateriaWindow extends Dialog<Materia>{
	
	Materia mater 
	
	new(WindowOwner ownwer, Materia model){
		super(ownwer,model)
		//el clone y la creacion del mater para manejo manual de cambios
		//generar una copia y guardarla como atributo auxiliar de la vista
		//al aceptar le pasamos al home el modelo de la vista (que está modificado)
		//Para aplicar esta estrategia el objeto de dominio tiene que ofrecer dos servicios:
//clone: devuelve una copia del objeto original, implementando la interfaz Cloneable (y redefiniendo el método clone)
//además del task
	mater=model.clone() as Materia
		
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


//agregadoLauASccept
override accept(){
	HomeMaterias.instance.crear("nombre")
	HomeMaterias.instance.actualizarMaterias(this.modelObject)
	super.accept
}
	
	def getHomeMaterias(){
	ApplicationContext.instance.getSingleton(typeof(Materia)) as HomeMaterias
}
	


}