import 'package:equatable/equatable.dart';
import 'package:graduation_project_book_app/models/vdp.dart';

abstract class SearchState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SearchInitalState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchLoadedState extends SearchState {
  final List<VdpItem> listItem;

  SearchLoadedState({this.listItem});
  @override
  // TODO: implement props
  List<Object> get props => [listItem];
}

class SearchErrorState extends SearchState {
  final String message;

  SearchErrorState({this.message});
  @override
  // TODO: implement props
  List<Object> get props => [message];
}
