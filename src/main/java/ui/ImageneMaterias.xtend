package ui

import org.uqbar.arena.widgets.Panel

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog
//import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.layout.ColumnLayout
//import org.uqbar.arena.widgets.Label
//import org.uqbar.arena.widgets.TextBox
import dominio.Materia
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.commons.utils.TransactionalAndObservable

@TransactionalAndObservable

class ImageneMaterias extends SimpleWindow<BuscadorMaterias>{
	
	new(WindowOwner parent) {
		super(parent, new BuscadorMaterias)
		modelObject.search()
	}
	override def createMainTemplate(Panel mainPanel){
		title="Seguidor De Carrera"
		taskDescription="Materias"
		super.createMainTemplate(mainPanel)
		this.crearResultadosGrilla(mainPanel)
	}
	
	def crearAccionesGrilla(Panel mainPanel) {
		var accionPanel=new Panel(mainPanel)
		accionPanel.setLayout(new HorizontalLayout)
		 new Button(accionPanel)
			.setCaption("Nueva Materia")
			.onClick[|this.openDialog(new CrearMateriaWindow(this))]
	}
	
	
	/*def crearMateria() {
		this.openDialog(new CrearMateriaWindow(this))
	}
	* 
	*/
	
	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.search]
		dialog.open
	}
	
	override protected addActions(Panel accionPanel) {
		//new Panel(mainPanel)
		//.setLayout(new HorizontalLayout)
		//accion crear nueva materia
		new Button(accionPanel)
			.setCaption("Nueva Materia")
			.onClick[|this.openDialog(new CrearMateriaWindow(this))]
	}
	
/*	override protected createFormPanel(Panel mainPanel) {
		var panel= new Panel(mainPanel)
		panel.setLayout(new ColumnLayout(1))
		var labelNombre= new Label(panel)
		labelNombre.text="Nombre"
		new TextBox(panel).bindValue("nombreMateria")
		
	}
 */
	
	def crearResultadosGrilla(Panel mainPanel) {
		var table=new Table<Materia>(mainPanel,typeof(Materia))
		table.heigth=200
		table.width=450
		table.bindItemsToProperty("materias")
		this.resultadosDeLaGrilla(table)
	}
	
	def resultadosDeLaGrilla(Table<Materia> table) {
		new Column<Materia>(table) 
			.setTitle("Nombre") //el nombre de la columna
			.setFixedSize(150) //el tamaño que va a tener
			.bindContentsToProperty("nombreMateria") //la propiedad que mostramos del objeto que está atrás de la fila
	}
	
	override protected createFormPanel(Panel mainPanel) {
		var panel= new Panel(mainPanel)
		panel.setLayout(new ColumnLayout(1))
	}
	
	
	
	
	
	
}