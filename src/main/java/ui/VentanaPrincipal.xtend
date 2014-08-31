package ui

import domain.Materia
import domain.Nota
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.CheckBox
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner

class VentanaPrincipal extends SimpleWindow<MateriaApplicationModel> {

	new(WindowOwner parent) {
		super(parent, new MateriaApplicationModel)

	}

	/*---------------------------Principal ---------------------------*/
	override def createMainTemplate(Panel mainPanel) {
		title = "Seguidor de Carrera"
		super.createMainTemplate(mainPanel)
		modelObject.conseguirMaterias()
	}

	override protected createFormPanel(Panel mainPanel) {

		val panel = new Panel(mainPanel)
		panel.setLayout(new ColumnLayout(2))

		val panelIzquierda = new Panel(panel)
		panelIzquierda.setLayout(new VerticalLayout)

		val panelDerecha = new Panel(panel)
		panelDerecha.setLayout(new VerticalLayout)

		crearPanelesIzquierda(panelIzquierda)
		cearPanelesDerecha(panelDerecha)
	}

	/*---------------------------Paneles ---------------------------*/
	def crearPanelesIzquierda(Panel panel) {

		crearTabla(panel)
		crearBotonNuevaMateria(panel)
	}

	def cearPanelesDerecha(Panel panel) {

		crearWidgetNombreMateriaSeleccionada(panel)

		crearWidgetAñoYFinal(panel)

		crearWidgetProfesor(panel)

		crearWidgetCuatrimestre(panel)

		crearWidgetNotas(panel)
	}

	/*---------------------------Acciones ---------------------------*/
	override protected addActions(Panel actionsPanel) {
	}

	def void crearMateria() {

		this.openDialog(new CrearMateriaWindow(this))
	}

	def void editarNota() {

		this.openDialog(new EditarNotaWindow(this, modelObject.notaSeleccionada))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.onAccept[|modelObject.conseguirMaterias]
		dialog.open
	}

	/*---------------------------Widgets ---------------------------*/
	def crearBotonNuevaMateria(Panel panel) {

		new Button(panel).setCaption("Nueva Materia").onClick[|this.crearMateria]

	}

	def crearTabla(Panel panel) {
		new Label(panel).setText("Materias")
		var table = new Table<Materia>(panel, typeof(Materia))
		table.heigth = 221
		table.width = 183

		table.bindItemsToProperty("materias")

		new Column<Materia>(table).setTitle("Nombre").bindContentsToProperty("nombre")
		table.bindValueToProperty("materiaSeleccionada")

	}

	def crearWidgetCuatrimestre(Panel panel) {
		val subPanel = new Panel(panel)
		subPanel.setLayout(new ColumnLayout(2))
		new Label(subPanel).setText("Ubicación materia:")
		val selector = new Selector(subPanel)
		selector.setWidth(140)
		selector.bindItemsToProperty("posiblesUbicaciones")
		selector.bindValueToProperty("materiaSeleccionada.ubicacion")
	}

	def crearWidgetProfesor(Panel panel) {
		val subPanel = new Panel(panel)
		subPanel.setLayout(new ColumnLayout(2))
		new Label(subPanel).setText("Profesor de cursada:")
		new TextBox(subPanel).setWidth(145).bindValueToProperty("materiaSeleccionada.profesor")
	}

	def crearWidgetAñoYFinal(Panel panel) {
		val subPanel = new Panel(panel)
		subPanel.setLayout(new ColumnLayout(4))
		new Label(subPanel).setText("Año cursada:")
		new TextBox(subPanel).setWidth(77).bindValueToProperty("materiaSeleccionada.añoCursada")
		new CheckBox(subPanel).bindValueToProperty("materiaSeleccionada.finalAprobado")
		new Label(subPanel).setText("Final aprobado")
	}

	def crearWidgetNombreMateriaSeleccionada(Panel panel) {
		new Label(panel).bindValueToProperty("materiaSeleccionada.nombre")
	}

	def crearWidgetNotas(Panel panel) {

		new Label(panel).setText("Notas de cursada:")

		var table = new Table<Nota>(panel, typeof(Nota))
		table.heigth = 100
		table.width = 240
		table.bindItemsToProperty("materiaSeleccionada.notas")
		table.bindValueToProperty("notaSeleccionada")
		new Column<Nota>(table).setTitle("Fecha").bindContentsToProperty("fecha")
		new Column<Nota>(table).setTitle("Descripción").bindContentsToProperty("descripcion")
		new Column<Nota>(table).setTitle("Aprobados").bindContentsToTransformer([nota|if(nota.aprobado) "SI" else "NO"])

		val subPanel = new Panel(panel)
		subPanel.setLayout(new ColumnLayout(3))
		new Button(subPanel).setCaption("Editar").onClick[|].setWidth(80) //this.editarNota] feature not tested

		//new Button(panel4).setCaption("+").onClick[|this.crearNota].setWidth(80)
		new Button(subPanel).setCaption("-").onClick[|modelObject.eliminarNotaSeleccionada].setWidth(80)
	}
}
