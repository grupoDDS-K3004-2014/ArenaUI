package home;

import com.google.common.base.Objects;
import dominio.Materia;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.collections15.Predicate;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.uqbar.commons.model.CollectionBasedHome;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class HomeMaterias extends CollectionBasedHome<Materia> {
  private static HomeMaterias instance = null;
  
  private List<Materia> materias;
  
  public HomeMaterias() {
    ArrayList<Materia> _arrayList = new ArrayList<Materia>();
    this.materias = _arrayList;
    this.init();
  }
  
  public void init() {
    this.crear("Arquitectura");
    this.crear("Ingenieria Y Sociedad");
    this.crear("Fisica 1");
    this.crear("Química");
    this.crear("Legislación");
  }
  
  public void crear(final String nombreMateria) {
    Materia materia = new Materia();
    materia.setNombreMateria(nombreMateria);
    this.create(materia);
    this.materias.add(materia);
  }
  
  public Class<Materia> getEntityType() {
    return Materia.class;
  }
  
  public Materia createExample() {
    return new Materia();
  }
  
  protected Predicate<Materia> getCriterio(final Materia example) {
    return null;
  }
  
  public List<Materia> search(final String nombre) {
    List<Materia> _allInstances = this.allInstances();
    final Function1<Materia,Boolean> _function = new Function1<Materia,Boolean>() {
      public Boolean apply(final Materia materia) {
        String _nombreMateria = materia.getNombreMateria();
        return Boolean.valueOf(HomeMaterias.this.match(_nombreMateria));
      }
    };
    Iterable<Materia> _filter = IterableExtensions.<Materia>filter(_allInstances, _function);
    return IterableExtensions.<Materia>toList(_filter);
  }
  
  public boolean match(final String nombre) {
    String _string = nombre.toString();
    String _lowerCase = _string.toLowerCase();
    String _string_1 = nombre.toString();
    String _lowerCase_1 = _string_1.toLowerCase();
    return _lowerCase.contains(_lowerCase_1);
  }
  
  public static HomeMaterias getInstance() {
    HomeMaterias _xblockexpression = null;
    {
      boolean _equals = Objects.equal(HomeMaterias.instance, null);
      if (_equals) {
        HomeMaterias _homeMaterias = new HomeMaterias();
        HomeMaterias.instance = _homeMaterias;
      }
      _xblockexpression = HomeMaterias.instance;
    }
    return _xblockexpression;
  }
  
  public String actualizarMaterias(final Materia materia) {
    String _xblockexpression = null;
    {
      this.materias.add(materia);
      _xblockexpression = InputOutput.<String>println(("Ahora materia tiene:" + this.materias));
    }
    return _xblockexpression;
  }
  
  public Object actualizarAbonado(final Materia materia) {
    String _xblockexpression = null;
    {
      String _nombreMateria = materia.getNombreMateria();
      boolean _equals = Objects.equal(_nombreMateria, null);
      if (_equals) {
        this.create(materia);
        this.materias.add(materia);
        return this.materias;
      }
      _xblockexpression = InputOutput.<String>println(("Ahora materias tiene:" + this.materias));
    }
    return _xblockexpression;
  }
}
