import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i/Constants/DataPaths.dart';
import 'package:flutter_i/Models/news.dart';
import 'package:flutter_i/Constants/NewsKey.dart';

class NewsController with ChangeNotifier {
  // List<ItemModel> news = [];
  List news = [];
  int theNewsIndex = 0;
  String path = newsPath_key;
  static int a = 0;
  Future<void> readJson(int check) async {
    if (a == 0) {
      //print("Hi\n");
      int check2 = check;
      //news.add("hi")
      check2++;
      //String jsonString = File(itemPath_key).readAsStringSync;
      final String response = await rootBundle.loadString(newsPath_key);
      final data = await json.decode(response);
      if (data.isNotEmpty) news = data["news"];
      if (news.isNotEmpty) {
        // print(news[0]["name"]);
        notifyListeners();
      }
    }
    a++;
  }

  // List<ItemModel> getNews (){
  List getNewsForFirsTime(int check) {
    // print("Hi2\n");
    int check2 = check;
    readJson(check2);
    //notifyListeners();

    return news;
  }

  String getTheNewsContent() {
    return news[theNewsIndex][news_content_key];
  }

  String getTheNewsTitle() {
    return news[theNewsIndex][news_title_key];
  }

  int setTheNewsIndex(int index) {
    theNewsIndex = index;
    return (index);
  }
}
