import 'package:flutter/material.dart';
import 'package:flutter_i/Controllers/local_storage.dart';
import 'package:flutter_i/Models/location.dart';
import 'package:provider/provider.dart';

class ProfileModel {
  String? username;
  String? fName;
  String? name;
  String? email;
  String? phone;
  LocationModel location;
  int? age;
  String? picture;

  ProfileModel(
      {required this.username,
      required this.fName,
      required this.name,
      required this.email,
      required this.phone,
      required this.location,
      required this.age,
      required this.picture});

  void setUsername({required BuildContext context, required String username}) {
    this.username = username;
    Provider.of<LocalStorageManager>(context, listen: false)
        .setUserName(value: username);
  }

  void setfName({required BuildContext context, required String fName}) {
    this.fName = fName;
    Provider.of<LocalStorageManager>(context, listen: false)
        .setFName(value: fName);
  }

  void setName({required BuildContext context, required String name}) {
    this.name = name;
    Provider.of<LocalStorageManager>(context, listen: false)
        .setName(value: name);
  }

  void setEmail({required BuildContext context, required String email}) {
    this.email = email;
    Provider.of<LocalStorageManager>(context, listen: false)
        .setEmail(value: email);
  }

  void setPhone({required BuildContext context, required String phone}) {
    this.phone = phone;
    Provider.of<LocalStorageManager>(context, listen: false)
        .setPhone(value: phone);
  }

  void setAge({required BuildContext context, int? age}) {
    if (age == null) return;
    this.age = age;
    Provider.of<LocalStorageManager>(context, listen: false).setAge(value: age);
  }

  void setPicture({required BuildContext context, required String picture}) {
    this.picture = picture;
    Provider.of<LocalStorageManager>(context, listen: false)
        .setImage(value: picture);
  }
}
