import 'package:flutter/cupertino.dart';
import 'package:graduation_project_book_app/logic/api.dart';
import 'package:graduation_project_book_app/models/user.dart';
import 'package:graduation_project_book_app/models/vdp.dart';

class TechMobile extends StatefulWidget {
  final Widget child;

  const TechMobile({Key key, this.child}) : super(key: key);
  static TechMobileState of(BuildContext context) {
    var _listenerInherited =
        context.dependOnInheritedWidgetOfExactType<TechMobileInherited>()
            as TechMobileInherited;
    return _listenerInherited.data;
  }

  @override
  TechMobileState createState() => TechMobileState();
}

class TechMobileState extends State<TechMobile> {
  List<VdpItem> vdpList;
  List<VdpItem> vdpListOld;
  List<VdpItem> listSaveUser;

  var isroom = '';
  int selectedRadioPrice;
  var selectedPrice;

  //host
  var typeRoom = '';
  var address = '';
  var ward = '';
  var district = '';
  var city = '';
  var descriptionRoom = '';
  var gac = '';
  var square = '';
  var wifi = '';
  var bathRoom = '';
  var bedRoom = '';

  Future<List<VdpItem>> getData() async {
    var result = await Api.fetchData();
    if (result != null)
      setState(() {
        vdpList = result;
        vdpListOld = result;
      });
    return result;
  }

  Future<List<VdpItem>> getListSave() async {
    var result = await Api.getListSave('2a5P2tAVxkXURkC2eOmV');
    if (result != null) 
      setState(() {
        listSaveUser = result;
      });
    return result;
  }

  void setSelectedPrice(var a) {
    setState(() {
      vdpList = a;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(isroom);
    return TechMobileInherited(data: this, child: widget.child);
  }
}

class TechMobileInherited extends InheritedWidget {
  TechMobileInherited({
    Key key,
    Widget child,
    this.data,
  }) : super(key: key, child: child);
  final TechMobileState data;

  @override
  bool updateShouldNotify(TechMobileInherited oldWidget) {
    return true;
  }
}
