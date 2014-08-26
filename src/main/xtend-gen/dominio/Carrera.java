package dominio;

import dominio.Materia;
import java.util.List;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class Carrera {
  private List<Materia> _materias;
  
  public List<Materia> getMaterias() {
    return this._materias;
  }
  
  public void setMaterias(final List<Materia> materias) {
    this._materias = materias;
  }
  
  public boolean agregarMaterias(final Materia materia) {
    List<Materia> _materias = this.getMaterias();
    return _materias.add(materia);
  }
}
