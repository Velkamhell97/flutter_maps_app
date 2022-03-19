import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

import '../../services/services.dart';

part 'permissions_event.dart';
part 'permissions_state.dart';

class PermissionsBloc extends Bloc<PermissionsEvent, PermissionsState> {
  PermissionsBloc() : super(PermissionsInitial()) {
    on<ChangePermissionsEvent>((event, emit) => emit(event.state));

    init();
  }

  //-Al parecer desde android 11, si se niega dos veces el permiso este queda como denegado por siempre y en el metodo
  //-checkPermission siempre devolvera denied en vez de deniedForever, por eso se debe hacer una logica extra;
  Future<void> init() async {
    LocationPermission permissions = await Geolocator.checkPermission();

    if(permissions == LocationPermission.denied || permissions == LocationPermission.deniedForever){
      permissions = await Geolocator.requestPermission();

      if(permissions == LocationPermission.deniedForever){
        await NotificationsService.showPermissionsServicesDialog();
        Geolocator.openAppSettings();
      }
    }

    if(permissions == LocationPermission.denied || permissions == LocationPermission.deniedForever){
      add(ChangePermissionsEvent(PermissionsDenied()));
    } else {
      add(ChangePermissionsEvent(PermissionsAllowed()));
    }
  }
}
