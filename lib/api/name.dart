import 'dart:convert';
import 'package:http/http.dart' as http;

List names = [];
Future<List> fetchData() async {
  const apiURL = "https://jsonplaceholder.typicode.com/users";
  final res = await http.get(
    Uri.parse(apiURL),
  );
  final data = json.decode(res.body);
  for (var i = 0; i < data.length; i++) {
    names.add(data[i]['name']);
  }
  return names;
}
