import 'package:flutter/material.dart';
import 'package:flutter_i/Controllers/local_storage.dart';
import 'package:provider/provider.dart';

class LocationModel {
  String? city;
  String? adress;
  int? number;
  String? area;
  String? country;

  LocationModel(
      {required this.city,
      required this.adress,
      required this.number,
      required this.area,
      required this.country});

  void setCity({required BuildContext context, required String city}) {
    this.city = city;
    Provider.of<LocalStorageManager>(context, listen: false)
        .setCity(value: city);
  }

  void setAdress({required BuildContext context, required String adress}) {
    this.adress = adress;
    Provider.of<LocalStorageManager>(context, listen: false)
        .setAdress(value: adress);
  }

  void setNumber({required BuildContext context, int? number}) {
    if (number == null) return;
    this.number = number;
    Provider.of<LocalStorageManager>(context, listen: false)
        .setNumber(value: number);
  }

  void setArea({required BuildContext context, required String area}) {
    this.area = area;
    Provider.of<LocalStorageManager>(context, listen: false)
        .setArea(value: area);
  }

  void setCountry({required BuildContext context, required String country}) {
    this.country = country;
    Provider.of<LocalStorageManager>(context, listen: false)
        .setCountry(value: country);
  }
}
