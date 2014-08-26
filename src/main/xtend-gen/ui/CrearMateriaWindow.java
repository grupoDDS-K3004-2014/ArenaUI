package ui;

import dominio.Materia;
import org.uqbar.arena.layout.ColumnLayout;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.WindowOwner;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;
import ui.EditarMateriaWindow;

@SuppressWarnings("all")
public class CrearMateriaWindow extends EditarMateriaWindow {
  public CrearMateriaWindow(final WindowOwner owner) {
    super(owner, new Materia());
    this.setTitle("Agregar nueva materia");
  }
  
  public void create(final Object object, final Materia materia) {
    throw new UnsupportedOperationException("TODO: auto-generated method stub");
  }
  
  protected void createFormPanel(final Panel mainPanel) {
    final Panel form = new Panel(mainPanel);
    ColumnLayout _columnLayout = new ColumnLayout(2);
    form.setLayout(_columnLayout);
    Label _label = new Label(form);
    _label.setText("Nombre");
    final TextBox txtNombre = new TextBox(form);
    txtNombre.setWidth(500);
    txtNombre.<ControlBuilder>bindValueToProperty("nombreMateria");
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
}
