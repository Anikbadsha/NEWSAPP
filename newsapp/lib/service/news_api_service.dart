import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/model/news_model.dart';

class NewsApiService {
  Future<List<Articles>> FetchNewsData() async {
    List<Articles> newsList = [];
    try {
      var link =
          "https://newsapi.org/v2/everything?q=bitcoin&apiKey=4d75e71cdd0c4360aa76d3e73137f745";

      var response = await http.get(Uri.parse(link));

      print("response is ${response.body}");
      var data = jsonDecode(response.body);

      Articles articles;
      for (var i in data["articles"]) {
        articles = Articles.fromJson(i);
        newsList.add(articles);
      }
    } catch (e) {
      print("The problem is : $e");
    }
    return newsList;
  }
}
