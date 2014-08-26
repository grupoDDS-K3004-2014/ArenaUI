package ui;

import dominio.Materia;
import home.HomeMaterias;
import org.uqbar.arena.Application;
import org.uqbar.arena.windows.Window;
import org.uqbar.commons.utils.ApplicationContext;
import ui.ImageneMaterias;

@SuppressWarnings("all")
public class VentanaMateria extends Application {
  protected Window<?> createMainWindow() {
    ApplicationContext _instance = ApplicationContext.getInstance();
    HomeMaterias _homeMaterias = new HomeMaterias();
    _instance.<HomeMaterias>configureSingleton(Materia.class, _homeMaterias);
    return new ImageneMaterias(this);
  }
  
  public static void main(final String[] args) {
    VentanaMateria _ventanaMateria = new VentanaMateria();
    _ventanaMateria.start();
  }
}
