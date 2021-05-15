import 'package:flutter/cupertino.dart';
import 'package:graduation_project_book_app/screens/fliter/fliter_screen.dart';
import 'package:graduation_project_book_app/screens/host/create_new_room.dart';
import 'package:graduation_project_book_app/screens/host/host_room_listing.dart';
import 'package:graduation_project_book_app/screens/host/host_screen.dart';
import 'package:graduation_project_book_app/screens/navigation_screen.dart';
import 'package:graduation_project_book_app/screens/signIn/signin.dart';
import 'package:graduation_project_book_app/screens/signUp/signup.dart';
import 'package:graduation_project_book_app/widgets/search_inbox.dart';

Map<String, WidgetBuilder> buildRoutes() {
  return {
    '/home': (BuildContext context) => NavigationScreen(),
    '/login': (BuildContext context) => LoginScreen(),
    '/host': (BuildContext context) => HostScreen(),
    '/hostRoomListing': (BuildContext context) => HostRoomListing(),
    '/createNewRoom': (BuildContext context) => CreateNewRoom(),
    '/fliterScreen': (BuildContext context) => FliterScreen(),
    'signUp': (BuildContext context) => SignUpScreen(),
    'seachInbox': (BuildContext context) => SearchInbox()
  };
}
