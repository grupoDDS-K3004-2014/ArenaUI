package ui;

import dominio.Materia;
import home.HomeMaterias;
import java.util.ArrayList;
import java.util.List;
import org.uqbar.commons.utils.ApplicationContext;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class BuscadorMaterias {
  private String _nombreMateria;
  
  public String getNombreMateria() {
    return this._nombreMateria;
  }
  
  public void setNombreMateria(final String nombreMateria) {
    this._nombreMateria = nombreMateria;
  }
  
  private List<Materia> _materias;
  
  public List<Materia> getMaterias() {
    return this._materias;
  }
  
  public void setMaterias(final List<Materia> materias) {
    this._materias = materias;
  }
  
  public void search() {
    ArrayList<Materia> _arrayList = new ArrayList<Materia>();
    this.setMaterias(_arrayList);
    HomeMaterias _homeMaerias = this.getHomeMaerias();
    String _nombreMateria = this.getNombreMateria();
    List<Materia> _search = _homeMaerias.search(_nombreMateria);
    this.setMaterias(_search);
  }
  
  public HomeMaterias getHomeMaerias() {
    ApplicationContext _instance = ApplicationContext.getInstance();
    return _instance.<HomeMaterias>getSingleton(Materia.class);
  }
}
