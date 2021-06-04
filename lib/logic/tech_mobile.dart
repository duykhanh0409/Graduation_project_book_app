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
  List<VdpItem> listSaveUser = [];
  List<VdpItem> listRoomFilterLocation = [];
  User user;
  var isroom = '';
  int selectedRadioPrice;
  var selectedPrice;
  //search room location
  String searchRoomLocation;
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

  //fliter room follow location
  void fliterRoomLocation(String location) {
    var newList = vdpListOld
        .where((element) =>
            element.address.ward.toUpperCase().contains(location.toUpperCase()))
        .toList();
    setState(() {
      ///không không h chổ này tạo một biến lưu list đã fliter địa điểm, lúc fliter có cái để setlai
      vdpList = newList;
      listRoomFilterLocation = newList;
    });
  }

//fliter trên listOld rồi ở bên explore nearby tab vo địa điểm cũng đem giá trị và filter trên listold
//tab vô địa điểm và filter trên listOld, listOld t
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
    var result = await Api.getListSave(user.id);
    if (result != null)
      setState(() {
        listSaveUser = result;
      });
    return result;
  }

  //fliter trên listOld
  void setSelectedPrice(var data) {
    setState(() {
      vdpList = data;
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
