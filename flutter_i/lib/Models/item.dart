import 'package:flutter/material.dart';
import 'package:flutter_i/Constants/ItemKey.dart';

class ItemModel {
  final String id;
  final String name;
  final int price;
  final String device;
  final int stock;
  final String imagePath;

  ItemModel(this.id, this.name, this.price, this.device, this.stock, this.imagePath);
  ItemModel.fromJson(Map<String, dynamic> json)
  :id = json[id_key], name = json[name_key], price = json[price_key], device = json[device_key], stock = json[stock_key], imagePath = json[imagePath_key];
}