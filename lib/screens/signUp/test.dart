// import 'package:flutter/material.dart';
// import 'package:google_places_flutter/address_search.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Google Places Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.amber,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Places Autocomplete Demo'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _controller = TextEditingController();

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: <Widget>[
//           TextField(
//             controller: _controller,
//             onTap: () async {
//               // should show search screen here
//               showSearch(
//                 context: context,
//                 // we haven't created AddressSearch class
//                 // this should be extending SearchDelegate
//                 delegate: AddressSearch(),
//               );
//             },
//             decoration: InputDecoration(
//               icon: Container(
//                 margin: EdgeInsets.only(left: 20),
//                 width: 10,
//                 height: 10,
//                 child: Icon(
//                   Icons.home,
//                   color: Colors.black,
//                 ),
//               ),
//               hintText: "Enter your shipping address",
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }import 'package:flutter/material.dart';
// import 'package:google_places_flutter/address_search.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Google Places Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.amber,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(title: 'Places Autocomplete Demo'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final _controller = TextEditingController();

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         children: <Widget>[
//           TextField(
//             controller: _controller,
//             onTap: () async {
//               // should show search screen here
//               showSearch(
//                 context: context,
//                 // we haven't created AddressSearch class
//                 // this should be extending SearchDelegate
//                 delegate: AddressSearch(),
//               );
//             },
//             decoration: InputDecoration(
//               icon: Container(
//                 margin: EdgeInsets.only(left: 20),
//                 width: 10,
//                 height: 10,
//                 child: Icon(
//                   Icons.home,
//                   color: Colors.black,
//                 ),
//               ),
//               hintText: "Enter your shipping address",
//               border: InputBorder.none,
//               contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class AddressSearch extends SearchDelegate<Suggestion> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         tooltip: 'Clear',
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       )
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       tooltip: 'Back',
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return null;
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return FutureBuilder(
//       // We will put the api call here
//       future: null,
//       builder: (context, snapshot) => query == ''
//           ? Container(
//               padding: EdgeInsets.all(16.0),
//               child: Text('Enter your address'),
//             )
//           : snapshot.hasData
//               ? ListView.builder(
//                   itemBuilder: (context, index) => ListTile(
//                     // we will display the data returned from our future here
//                     title:
//                         Text(snapshot.data[index]),
//                     onTap: () {
//                       close(context, snapshot.data[index]);
//                     },
//                   ),
//                   itemCount: snapshot.data.length,
//                 )
//               : Container(child: Text('Loading...')),
//     );
//   }
// }

// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart';

// // For storing our result
// class Suggestion {
//   final String placeId;
//   final String description;

//   Suggestion(this.placeId, this.description);

//   @override
//   String toString() {
//     return 'Suggestion(description: $description, placeId: $placeId)';
//   }
// }

// class PlaceApiProvider {
//   final client = Client();

//   PlaceApiProvider(this.sessionToken);

//   final sessionToken;

//   static final String androidKey = 'YOUR_API_KEY_HERE';
//   static final String iosKey = 'YOUR_API_KEY_HERE';
//   final apiKey = Platform.isAndroid ? androidKey : iosKey;

//   Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
//     final request =
//         'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&types=address&language=$lang&components=country:ch&key=$apiKey&sessiontoken=$sessionToken';
//     final response = await client.get(request);

//     if (response.statusCode == 200) {
//       final result = json.decode(response.body);
//       if (result['status'] == 'OK') {
//         // compose suggestions in a list
//         return result['predictions']
//             .map<Suggestion>((p) => Suggestion(p['place_id'], p['description']))
//             .toList();
//       }
//       if (result['status'] == 'ZERO_RESULTS') {
//         return [];
//       }
//       throw Exception(result['error_message']);
//     } else {
//       throw Exception('Failed to fetch suggestion');
//     }
//   }

//   Future<Place> getPlaceDetailFromId(String placeId) async {
//     // if you want to get the details of the selected place by place_id
//   }
// }