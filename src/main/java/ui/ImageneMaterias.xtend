package ui

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.windows.WindowOwner
import dominio.Carrera
import dominio.Materia
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.Dialog

class ImageneMaterias extends SimpleWindow<Carrera>{
	
	new(WindowOwner parent, Carrera model) {
		super(parent, model)
		title="Seguidor De Carrera"
		taskDescription="Materias"
	}
	
	override protected addActions(Panel actionsPanel) {
		//accion crear nueva materia
		new Button(actionsPanel)
			.setCaption("Nueva Materia")
			.onClick[|this.openDialog(new CrearMateriaWindow(this))]
	}
	
		def openDialog(Dialog<?> dialog) {
		//dialog.onAccept[|modelObject.search]
		dialog.open
	}
	
	
	
	override protected createFormPanel(Panel mainPanel) {
		//creamos el componente tabla para mostrar los numeros ganadores de la loteria!
		var Table<Materia> materias = new Table<Materia>(mainPanel, typeof(Materia));

		//bindeamos el contenido de la tabla
		materias.bindItemsToProperty("materias")
		
		//le definimos el alto y ancho, esto es opcional
		//materias
			//.setHeigth(200)

		//describimos cada fila
		//para esto definios las celdas de cada fila
		
		//la loteria de la que vamos a hablar 
		new Column<Materia>(materias) 
			.setTitle("Nombre") //el nombre de la columna
			.setFixedSize(250) //el tamaño que va a tener
			.bindContentsToProperty("nombre") //la propiedad que mostramos del objeto que está atrás de la fila

		//el numero que salió en la loteria 
		//new Column<Materia>(materias) //
			//.setTitle("descripcion")
			//.setFixedSize(150)
			//.bindContentsToProperty("descripcion")
			
		
	}
	
}