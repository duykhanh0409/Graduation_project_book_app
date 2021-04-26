import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/screens/fliter/fliter_screen.dart';
import 'package:graduation_project_book_app/screens/home/home_screen.dart';
import 'package:graduation_project_book_app/screens/profile/profile_screen.dart';
import 'package:graduation_project_book_app/screens/search/search_screen.dart';
import 'package:graduation_project_book_app/screens/vdp/vdp_Screen.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedItem = 0;
  List<Widget> screens = [
    HomePage(),
    SearchScreen(),
    // Container(
    //   child: Center(
    //     child: Text('Save'),
    //   ),
    // ),
    FliterScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        iconList: [
          Icons.home_outlined,
          Icons.search,
          Icons.favorite_border,
          Icons.settings,
        ],
        onChange: (val) {
          setState(() {
            _selectedItem = val;
          });
        },
        defaultSelectedIndex: 1,
      ),
      body: Center(
        child: Center(
          child: screens[_selectedItem],
        ),
      ),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      @required this.iconList,
      @required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];
  List<String> title = ['Home', 'Search', 'Save', 'Profile'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i, title[i]));
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            //spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(1, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: _navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index, String title) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width / _iconList.length,
          decoration: index == _selectedIndex
              ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xFFE85B00)),
                  ),

                  // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                )
              : BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: index == _selectedIndex
                    ? Color(0xFFE85B00)
                    : Colors.black.withOpacity(0.5),
              ),
              Text(
                title,
                style: TextStyle(
                    color: index == _selectedIndex
                        ? Colors.black
                        : Colors.black.withOpacity(0.5),
                    fontWeight: index == _selectedIndex
                        ? FontWeight.w600
                        : FontWeight.w600),
              ),
            ],
          )),
    );
  }
}
