import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/models.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

//-Otra de forma de crear un bloc esta vez con el paquete freezed
class SearchBloc extends Bloc<SearchEvent, SearchState> {

  //-Esta es una manera de crear variables dentro del bloc es como una mezcla de los estados y las clases como el
  //-mapBloc y locationBloc, ahora bien esto funciona unicamente porque la lista de historial, no modifica el UI
  //-sencillamente la mostramos siempre que no hay query en la busqueda, por lo tanto podemos llamarlo y actualizarlo
  //-sin que haya un cambio en el ui, diferente a lo que ocurre con los otros estados del search (que no todos)
  //-modifican el UI, pero es una buena alternativa porque no tuvimos que agregar mucha complejidad
  //-ni cambiar el bloc a uno tipo clase, tambien se hizo un bloc con este metodo
  Set<Feature> record = {};

  //-Para implementar la memoria del searchbar, a diferencia del search2Bloc que es una clase, este no tiene metodos
  //-para redibujarse, por lo que si se hubiera utilizado seria necesario disparar un evento cualquiera (que cambiara)
  //-el actual en el bloc y de esta manera poder usar esta valor actualizado con  un blocBuilder
  Feature? last;

  SearchBloc() : super(const _SearchCanceled()) {
    on<_SearchAction>((event, emit) => emit(event.state));
  }
}
