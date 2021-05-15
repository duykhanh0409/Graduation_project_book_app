import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_book_app/bloc/searchBloc/search_event.dart';
import 'package:graduation_project_book_app/bloc/searchBloc/search_state.dart';
import 'package:graduation_project_book_app/bloc/vdpBloc/vdp_event.dart';
import 'package:graduation_project_book_app/bloc/vdpBloc/vdp_state.dart';
import 'package:graduation_project_book_app/models/vdp.dart';
import 'package:graduation_project_book_app/services/search_services.dart';
import 'package:graduation_project_book_app/services/vdp_services.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchService searchService = new SearchService();
  final SearchService _searchService;

  SearchBloc(this._searchService) : super(SearchInitalState());

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) async* {
    List<VdpItem> listItem;
    switch (event.runtimeType) {
      case FetchData:
        // FetchData fetchEvent = event;
        yield SearchLoadingState();
        try {
          listItem = await searchService.fetchData();
          if (listItem != null) {
            yield SearchLoadedState(
                listItem: listItem); //state này chứa data rùi nè
          }
        } catch (e) {
          yield SearchErrorState(message: e.toString());
        }
    }
  }
}
