package dominio;

import org.eclipse.xtext.xbase.lib.Exceptions;
import org.uqbar.commons.model.Entity;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class Materia extends Entity implements Cloneable {
  private String _nombreMateria;
  
  public String getNombreMateria() {
    return this._nombreMateria;
  }
  
  public void setNombreMateria(final String nombreMateria) {
    this._nombreMateria = nombreMateria;
  }
  
  public Object clone() {
    try {
      return super.clone();
    } catch (Throwable _e) {
      throw Exceptions.sneakyThrow(_e);
    }
  }
  
  public Object validar() {
    return null;
  }
}
