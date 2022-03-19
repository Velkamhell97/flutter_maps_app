part of 'permissions_bloc.dart';

abstract class PermissionsEvent extends Equatable {
  const PermissionsEvent();

  @override
  List<Object> get props => [];
}

class ChangePermissionsEvent extends PermissionsEvent {
  final PermissionsState state;
  const ChangePermissionsEvent(this.state);
}