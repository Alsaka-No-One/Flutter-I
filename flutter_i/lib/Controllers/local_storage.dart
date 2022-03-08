import 'dart:convert';

import 'package:flutter_i/Constants/local_keys.dart';
import 'package:flutter_i/Models/location.dart';
import 'package:flutter_i/Models/profile.dart';
import 'package:flutter_i/Services/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageManager extends SharedPref {
  LocalStorageManager({required SharedPreferences instance})
      : super(instance: instance);
//SETTERS
  void setImage({required String value}) =>
      setString(key: imageK, value: value);
  void setUserName({required String value}) =>
      setString(key: usernameK, value: value);
  void setFName({required String value}) =>
      setString(key: fNameK, value: value);
  void setName({required String value}) => setString(key: nameK, value: value);
  void setEmail({required String value}) =>
      setString(key: emailK, value: value);
  void setPhone({required String value}) =>
      setString(key: phoneK, value: value);
  void setAge({required int value}) => setInt(key: ageK, value: value);
  void setNumber({required int value}) => setInt(key: numberK, value: value);
  void setCity({required String value}) => setString(key: cityK, value: value);
  void setAdress({required String value}) =>
      setString(key: adressK, value: value);
  void setArea({required String value}) => setString(key: areaK, value: value);
  void setCountry({required String value}) =>
      setString(key: countryK, value: value);

  //GETTERS
  String? getImage() => getString(key: imageK);
  String? getUserName() => getString(key: usernameK);
  String? getFName() => getString(key: fNameK);
  String? getName() => getString(key: nameK);
  String? getEmail() => getString(key: emailK);
  String? getPhone() => getString(key: phoneK);
  int? getAge() => getInt(key: ageK);
  int? getNumber() => getInt(key: numberK);
  String? getCity() => getString(key: cityK);
  String? getAdress() => getString(key: adressK);
  String? getArea() => getString(key: areaK);
  String? getCountry() => getString(key: countryK);

  ProfileModel loadProfile() {
    return ProfileModel(
        username: getUserName(),
        fName: getFName(),
        name: getName(),
        email: getEmail(),
        phone: getPhone(),
        location: LocationModel(
            adress: getAdress(),
            city: getCity(),
            area: getArea(),
            number: getNumber(),
            country: getCountry()),
        age: getAge(),
        picture: getImage());
  }
}
