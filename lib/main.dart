import 'package:flutter/material.dart';
import 'package:graduation_project_book_app/screens/navigation_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            appBarTheme: Theme.of(context)
                .appBarTheme
                .copyWith(brightness: Brightness.light)),
        home: NavigationScreen());
        //home: HomePage3());
  }
}

// class HomePage3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox.expand(
//         child: DraggableScrollableSheet(
//           builder: (BuildContext context, ScrollController scrollController) {
//             return Container(
//               color: Colors.blue[100],
//               child: ListView.builder(
//                 controller: scrollController,
//                 itemCount: 25,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(title: Text('Item $index'));
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
