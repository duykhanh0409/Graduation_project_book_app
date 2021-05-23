import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/config/build_router.dart';
import 'package:graduation_project_book_app/logic/tech_mobile.dart';
import 'package:graduation_project_book_app/screens/signIn/signin.dart';

void main() {
  runApp(TechMobile(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            appBarTheme: Theme.of(context)
                .appBarTheme
                .copyWith(brightness: Brightness.light)),
        //home: NavigationScreen());
        home: LoginScreen(),
        routes: buildRoutes());
  }
}
