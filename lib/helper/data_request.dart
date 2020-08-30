import 'dart:convert';

import 'package:appnews/models/ResponseNews.dart';
import 'package:http/http.dart' as http;

String apiKey = '11f1b478a9da40d2ad28e7122af6db19';

class News{
  Future<ResponseNews> getNews() async{
    String url = 'https://newsapi.org/v2/top-headlines?country=id&apiKey=$apiKey';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseNews.fromJsonMap(jsonData);
  }
}

class NewsByCategory{
  Future<ResponseNews> getNewsByCategory(String category) async{
    String url = 'https://newsapi.org/v2/top-headlines?country=id&category=$category&apiKey=$apiKey';

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ResponseNews.fromJsonMap(jsonData);
  }
}

