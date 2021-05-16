import 'package:equatable/equatable.dart';

abstract class VdpEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchEvent extends VdpEvent {
  final String id;

  FetchEvent({this.id});
  @override
  // TODO: implement props
  List<Object> get props => [];
}
