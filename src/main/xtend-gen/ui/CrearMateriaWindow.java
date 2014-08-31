package ui;

import domain.Materia;
import home.HomeMaterias;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.commons.utils.ApplicationContext;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class CrearMateriaWindow extends Dialog<Materia> {
  public CrearMateriaWindow(final WindowOwner parent) {
    super(parent, new Materia());
  }
  
  public void createMainTemplate(final Panel mainPanel) {
    this.setTitle("Agregar materia nueva");
    this.setTaskDescription("Ingrese el nombre de la materia nueva");
    super.createMainTemplate(mainPanel);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    TextBox _textBox = new TextBox(mainPanel);
    _textBox.<ControlBuilder>bindValueToProperty("nombre");
  }
  
  public void executeTask() {
    HomeMaterias _homeMaterias = this.getHomeMaterias();
    Materia _modelObject = this.getModelObject();
    _homeMaterias.create(_modelObject);
    super.executeTask();
  }
  
  protected void addActions(final Panel actions) {
    Button _button = new Button(actions);
    Button _setCaption = _button.setCaption("Aceptar");
    final Action _function = new Action() {
      public void execute() {
        CrearMateriaWindow.this.accept();
      }
    };
    Button _onClick = _setCaption.onClick(_function);
    Button _setAsDefault = _onClick.setAsDefault();
    _setAsDefault.disableOnError();
    Button _button_1 = new Button(actions);
    Button _setCaption_1 = _button_1.setCaption("Cancelar");
    final Action _function_1 = new Action() {
      public void execute() {
        CrearMateriaWindow.this.cancel();
      }
    };
    _setCaption_1.onClick(_function_1);
  }
  
  public HomeMaterias getHomeMaterias() {
    ApplicationContext _instance = ApplicationContext.getInstance();
    return _instance.<HomeMaterias>getSingleton(Materia.class);
  }
}
