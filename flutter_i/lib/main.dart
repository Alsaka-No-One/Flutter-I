import 'package:flutter/material.dart';
import 'package:flutter_i/Constants/routes.dart';
import 'package:flutter_i/Controllers/local_storage.dart';
import 'package:flutter_i/Controllers/ItemController.dart';
import 'package:flutter_i/Controllers/NewsController.dart';
import 'package:flutter_i/Pages/the_news_page.dart';
import 'package:flutter_i/Routes/the_news_route.dart';
import 'package:provider/provider.dart';
import 'package:flutter_i/Routes/command_route.dart';
import 'package:flutter_i/Routes/main_route.dart';
import 'package:flutter_i/Routes/profile_route.dart';
import 'package:flutter_i/Widgets/transition_builders.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  final prefs = await SharedPreferences.getInstance();
  runApp(MultiProvider(providers: [
    Provider(create: (context) => LocalStorageManager(instance: prefs)),
    ChangeNotifierProvider(create: (context) => ItemController()),
    ChangeNotifierProvider(create: (context) => NewsController())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final TransitionBuilders _transitionBuilders = TransitionBuilders();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: mainRoute,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case mainRoute:
              return MaterialPageRoute(builder: (context) => const MainRoute());
            case commandRoute:
              return MaterialPageRoute(²
                  builder: (context) => const CommandRoute());
            case profileRoute:
              return _transitionBuilders.slidingUp(
                  widget: const ProfileRoute());
            case theNewsRoute:
              return MaterialPageRoute(
                  builder: (context) => const TheNewsRoute());
            default:
              return null;
          }
        });
  }
}
