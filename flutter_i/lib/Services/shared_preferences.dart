import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref extends ChangeNotifier {
  final SharedPreferences instance;

  SharedPref({required this.instance});
//UTILS
  void clear() => instance.clear();

  void remove({required String key}) => instance.remove(key);

  bool containsKey({required String key}) => instance.containsKey(key);

//SETTERS
  void setBool({required String key, required bool value}) =>
      instance.setBool(key, value);

  void setInt({required String key, required int value}) =>
      instance.setInt(key, value);

  void setDouble({required String key, required double value}) =>
      instance.setDouble(key, value);

  void setString({required String key, required String value}) =>
      instance.setString(key, value);

  void setStringList({required String key, required List<String> value}) =>
      instance.setStringList(key, value);

//GETTERS
  dynamic getValue({required String key}) => instance.get(key);

  bool? getBool({required String key}) => instance.getBool(key);

  int? getInt({required String key}) => instance.getInt(key);

  double? getDouble({required String key}) => instance.getDouble(key);

  String? getString({required String key}) => instance.getString(key);

  List<String>? getStringList({required String key}) =>
      instance.getStringList(key);

  Set<String> getKeys() => instance.getKeys();
}
