import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i/Constants/DataPaths.dart';
import 'package:flutter_i/Models/item.dart';
import 'package:provider/provider.dart';

class ItemController with ChangeNotifier {
  // List<ItemModel> items = [];
  List items = [];
  String path = itemPath_key;
  static int a = 0;
  Future<void> readJson(int check) async {
    if (a == 0) {
      //print("Hi\n");
      int check2 = check;
      //items.add("hi")
      check2++;
      //String jsonString = File(itemPath_key).readAsStringSync;
      final String response = await rootBundle.loadString(itemPath_key);
      final data = await json.decode(response);
      if (data.isNotEmpty) items = data["items"];
      if (items.isNotEmpty) {
        // print(items[0]["name"]);
        notifyListeners();
      }
    }
    a++;
  }

  // List<ItemModel> getItems (){
  List getItemsForFirsTime(int check) {
    // print("Hi2\n");
    int check2 = check;
    readJson(check2);
    //notifyListeners();

    return items;
  }

  List getItems(int check) {
    // print("Hi3\n");
    int check2 = check;
    //notifyListeners();

    return items;
  }

  void addToCart(int index) {
    print(items[0]["stock"]);
    if (items[index]["stock"] > 0) {
      items[index]["stock"] -= 1;
      items[index]["inCart"] += 1;
    }
    print(items[0]["stock"]);

    notifyListeners();
  }

  void removeFromCart(int index) {
    if (items[index]["inCart"] >= 1) {
      items[index]["inCart"] -= 1;
      items[index]["stock"] += 1;
    }
    notifyListeners();
  }

  void buyItems(int check) {
    for (int i = 0; i <= 5 ;i++){
      items[i]["inCart"] = 0;
    }
    notifyListeners();
  }
}