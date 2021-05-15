import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project_book_app/bloc/vdpBloc/vdp_event.dart';
import 'package:graduation_project_book_app/bloc/vdpBloc/vdp_state.dart';
import 'package:graduation_project_book_app/models/vdp.dart';
import 'package:graduation_project_book_app/services/vdp_services.dart';

class VdpBloc extends Bloc<VdpEvent, VdpState> {
  Vdpservice vdpservice = new Vdpservice();
  final Vdpservice _vdpservice;

  VdpBloc(this._vdpservice) : super(VdpinitialState());
  @override
  Stream<VdpState> mapEventToState(VdpEvent event) async* {
    List<VdpItem> vdpItem;
    switch (event.runtimeType) {
      case FetchEvent:
        //FetchEvent fetchEvent = event;
        yield VdpLoadingState();
        try {
          vdpItem = await vdpservice.fetchVdp();
          if (vdpItem != null) {
            yield VdpLoadedState(vdpItem: vdpItem); //state này chứa data rùi nè
          }
        } catch (e) {
          yield VdpLoadError(message: e.toString());
        }
    }
  }
}
