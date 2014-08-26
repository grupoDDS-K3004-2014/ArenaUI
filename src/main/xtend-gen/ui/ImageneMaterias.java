package ui;

import dominio.Materia;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.layout.HorizontalLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.tables.Column;
import org.uqbar.arena.widgets.tables.Table;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.SimpleWindow;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;
import ui.BuscadorMaterias;
import ui.CrearMateriaWindow;

@SuppressWarnings("all")
public class ImageneMaterias extends SimpleWindow<BuscadorMaterias> {
  public ImageneMaterias(final WindowOwner parent) {
    super(parent, new BuscadorMaterias());
    BuscadorMaterias _modelObject = this.getModelObject();
    _modelObject.search();
  }
  
  public void createMainTemplate(final Panel mainPanel) {
    this.setTitle("Seguidor De Carrera");
    this.setTaskDescription("Materias");
    super.createMainTemplate(mainPanel);
    this.crearResultadosGrilla(mainPanel);
  }
  
  public Button crearAccionesGrilla(final Panel mainPanel) {
    Button _xblockexpression = null;
    {
      Panel accionPanel = new Panel(mainPanel);
      HorizontalLayout _horizontalLayout = new HorizontalLayout();
      accionPanel.setLayout(_horizontalLayout);
      Button _button = new Button(accionPanel);
      Button _setCaption = _button.setCaption("Nueva Materia");
      final Action _function = new Action() {
        public void execute() {
          CrearMateriaWindow _crearMateriaWindow = new CrearMateriaWindow(ImageneMaterias.this);
          ImageneMaterias.this.openDialog(_crearMateriaWindow);
        }
      };
      _xblockexpression = _setCaption.onClick(_function);
    }
    return _xblockexpression;
  }
  
  /**
   * def crearMateria() {
   * this.openDialog(new CrearMateriaWindow(this))
   * }
   */
  public void openDialog(final Dialog<?> dialog) {
    final Action _function = new Action() {
      public void execute() {
        BuscadorMaterias _modelObject = ImageneMaterias.this.getModelObject();
        _modelObject.search();
      }
    };
    dialog.onAccept(_function);
    dialog.open();
  }
  
  protected void addActions(final Panel accionPanel) {
    Button _button = new Button(accionPanel);
    Button _setCaption = _button.setCaption("Nueva Materia");
    final Action _function = new Action() {
      public void execute() {
        CrearMateriaWindow _crearMateriaWindow = new CrearMateriaWindow(ImageneMaterias.this);
        ImageneMaterias.this.openDialog(_crearMateriaWindow);
      }
    };
    _setCaption.onClick(_function);
  }
  
  /**
   * override protected createFormPanel(Panel mainPanel) {
   * var panel= new Panel(mainPanel)
   * panel.setLayout(new ColumnLayout(1))
   * var labelNombre= new Label(panel)
   * labelNombre.text="Nombre"
   * new TextBox(panel).bindValue("nombreMateria")
   * 
   * }
   */
  public Column<Materia> crearResultadosGrilla(final Panel mainPanel) {
    Column<Materia> _xblockexpression = null;
    {
      Table<Materia> table = new Table<Materia>(mainPanel, Materia.class);
      table.setHeigth(200);
      table.setWidth(450);
      table.bindItemsToProperty("materias");
      _xblockexpression = this.resultadosDeLaGrilla(table);
    }
    return _xblockexpression;
  }
  
  public Column<Materia> resultadosDeLaGrilla(final Table<Materia> table) {
    Column<Materia> _column = new Column<Materia>(table);
    Column<Materia> _setTitle = _column.setTitle("Nombre");
    Column<Materia> _setFixedSize = _setTitle.setFixedSize(150);
    return _setFixedSize.bindContentsToProperty("nombreMateria");
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    Panel panel = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(1);
    panel.setLayout(_columnLayout);
  }
}
