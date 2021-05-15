import 'package:equatable/equatable.dart';
import 'package:graduation_project_book_app/models/vdp.dart';

abstract class VdpState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class VdpinitialState extends VdpState {}

class VdpLoadingState extends VdpState {}

class VdpLoadedState extends VdpState {
  final List<VdpItem> vdpItem;

  VdpLoadedState({this.vdpItem});
  @override
  // TODO: implement props
  List<Object> get props => [vdpItem];
}

class VdpLoadError extends VdpState {
  final String message;

  VdpLoadError({this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
