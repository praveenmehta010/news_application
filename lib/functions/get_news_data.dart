import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List> getNewsData() async{
  final apiResponse = await http.get(Uri.parse("https://newsapi.org/v2/everything?q=tesla&from=2022-12-08&sortBy=publishedAt&apiKey=b8e6eac8804b44ab866450ae99af79d3"));

  Map response = jsonDecode(apiResponse.body);
  // print("got data");
  return (response['articles']);
}