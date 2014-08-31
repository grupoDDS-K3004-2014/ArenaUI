package home;

import com.google.common.base.Objects;
import domain.Materia;
import domain.Nota;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.collections15.Predicate;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.uqbar.commons.model.CollectionBasedHome;
import org.uqbar.commons.model.UserException;
import org.uqbar.commons.utils.Observable;

@Observable
@SuppressWarnings("all")
public class HomeMaterias extends CollectionBasedHome<Materia> {
  public HomeMaterias() {
    this.init();
  }
  
  public void init() {
    ArrayList<Nota> notas = new ArrayList<Nota>();
    Nota _nota = new Nota("20/10/2014", "1 Parcial", Boolean.valueOf(true));
    notas.add(_nota);
    this.create("Algoritmos", Integer.valueOf(2004), Boolean.valueOf(false), "Sarlanga", "1c", notas);
    ArrayList<Nota> _arrayList = new ArrayList<Nota>();
    notas = _arrayList;
    Nota _nota_1 = new Nota("30/12/2099", "Tp", Boolean.valueOf(true));
    notas.add(_nota_1);
    this.create("Fisica II", Integer.valueOf(2011), Boolean.valueOf(true), "Monzón", "A", notas);
  }
  
  public void create(final String nombreMateria, final Integer añoCursada2, final Boolean finalAprobado2, final String profesor2, final String ubicacion2, final ArrayList<Nota> notas2) {
    Materia materia = new Materia();
    materia.setNombre(nombreMateria);
    materia.setAñoCursada(añoCursada2);
    materia.setFinalAprobado(finalAprobado2);
    materia.setProfesor(profesor2);
    materia.setUbicacion(ubicacion2);
    materia.setNotas(notas2);
    this.create(materia);
  }
  
  public void validateCreate(final Materia materia) {
    materia.validate();
    this.validarMateriasDuplicadas(materia);
  }
  
  public void validarMateriasDuplicadas(final Materia materia) {
    List<Materia> _allInstances = this.allInstances();
    final Function1<Materia, Boolean> _function = new Function1<Materia, Boolean>() {
      public Boolean apply(final Materia materia2) {
        String _nombre = materia.getNombre();
        String _nombre_1 = materia2.getNombre();
        return Boolean.valueOf(HomeMaterias.this.match(_nombre, _nombre_1));
      }
    };
    Iterable<Materia> _filter = IterableExtensions.<Materia>filter(_allInstances, _function);
    final List<Materia> lista = IterableExtensions.<Materia>toList(_filter);
    boolean _isEmpty = lista.isEmpty();
    boolean _not = (!_isEmpty);
    if (_not) {
      String _nombre = materia.getNombre();
      String _plus = ("Ya existe una materia con el nombre " + _nombre);
      throw new UserException(_plus);
    }
  }
  
  public boolean match(final Object expectedValue, final Object realValue) {
    boolean _xblockexpression = false;
    {
      boolean _equals = Objects.equal(expectedValue, null);
      if (_equals) {
        return true;
      }
      boolean _equals_1 = Objects.equal(realValue, null);
      if (_equals_1) {
        return false;
      }
      String _string = realValue.toString();
      String _lowerCase = _string.toLowerCase();
      String _string_1 = expectedValue.toString();
      String _lowerCase_1 = _string_1.toLowerCase();
      _xblockexpression = _lowerCase.contains(_lowerCase_1);
    }
    return _xblockexpression;
  }
  
  public Predicate<Materia> getCriterio(final Materia example) {
    return null;
  }
  
  public Materia createExample() {
    return new Materia();
  }
  
  public Class<Materia> getEntityType() {
    return Materia.class;
  }
  
  public List<Materia> getMaterias() {
    return this.allInstances();
  }
}
