import 'dart:io';

void main() async {
  final file = File('file.txt');

  var length = await file.length();
  print(length);
}