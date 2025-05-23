import 'package:codeforces_finder/main.dart';

Future<List> find(name, surname) async {
  Set handles = {};

  try {
    handles.addAll(data[name][surname]);
  } catch (e) {
    Null;
  }
  try {
    handles.addAll(data[surname][name]);
  } catch (e) {
    Null;
  }

  return handles.toList();
}
