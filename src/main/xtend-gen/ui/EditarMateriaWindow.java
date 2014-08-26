package ui;

import dominio.Materia;
import home.HomeMaterias;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.Dialog;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.commons.utils.ApplicationContext;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.WindowBuilder;

@SuppressWarnings("all")
public class EditarMateriaWindow extends Dialog<Materia> {
  public EditarMateriaWindow(final WindowOwner ownwer, final Materia model) {
    super(ownwer, model);
    WindowBuilder _delegate = this.getDelegate();
    _delegate.setErrorViewer(this);
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    final Panel form = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(1);
    form.setLayout(_columnLayout);
    Label _label = new Label(form);
    _label.setText("Nombre:");
    final TextBox txtNombre = new TextBox(form);
    txtNombre.setWidth(200);
    txtNombre.<ControlBuilder>bindValueToProperty("nombreMateria");
    this.addBotones(form);
  }
  
  public Button addBotones(final Panel actions) {
    Button _xblockexpression = null;
    {
      Button _button = new Button(actions);
      Button _setCaption = _button.setCaption("Aceptar");
      final Action _function = new Action() {
        public void execute() {
          EditarMateriaWindow.this.accept();
        }
      };
      Button _onClick = _setCaption.onClick(_function);
      Button _setAsDefault = _onClick.setAsDefault();
      _setAsDefault.disableOnError();
      Button _button_1 = new Button(actions);
      Button _setCaption_1 = _button_1.setCaption("Cancelar");
      final Action _function_1 = new Action() {
        public void execute() {
          EditarMateriaWindow.this.cancel();
        }
      };
      _xblockexpression = _setCaption_1.onClick(_function_1);
    }
    return _xblockexpression;
  }
  
  public void accept() {
    HomeMaterias _instance = HomeMaterias.getInstance();
    Materia _modelObject = this.getModelObject();
    _instance.actualizarMaterias(_modelObject);
    super.accept();
  }
  
  public Object getHomeMaterias() {
    ApplicationContext _instance = ApplicationContext.getInstance();
    return _instance.<Object>getSingleton(HomeMaterias.class);
  }
}
