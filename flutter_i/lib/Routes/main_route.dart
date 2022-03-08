import 'package:flutter/material.dart';
import 'package:flutter_i/Pages/cart_page.dart';
import 'package:flutter_i/Pages/home_page.dart';
import 'package:flutter_i/Pages/news_page.dart';
import 'package:flutter_i/Pages/search_page.dart';
import 'package:flutter_i/Widgets/custom_app_bar.dart';
import 'package:flutter_i/Widgets/custom_navigation_bar.dart';
import 'package:flutter_i/Widgets/menu_drawer.dart';

class MainRoute extends StatefulWidget {
  const MainRoute({Key? key}) : super(key: key);

  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute> {
  int index = 0;

  void setIndex(int navIndex) {
    setState(() {
      index = navIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomePage(),
      const NewsPage(),
      const SearchPage(),
      const CartPage(),
    ];

    List<String> titles = ["Home", "News", "Search", "Cart"];

    List<IconData> navigation = [
      Icons.home_rounded,
      Icons.list_alt_rounded,
      Icons.search_rounded,
      Icons.shopping_cart,
    ];
    return Scaffold(
        drawer: const MenuDrawer(),
        appBar: PreferredSize(
            child: CustomAppBar(
                icon: Icons.person_rounded,
                onTap: (context) => Scaffold.of(context).openDrawer(),
                title: titles[index]),
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).devicePixelRatio * 35)),
        body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchOutCurve: Curves.linearToEaseOut,
            switchInCurve: Curves.linearToEaseOut,
            child: pages[index],
            transitionBuilder: (Widget widget, Animation<double> animation) =>
                SizeTransition(sizeFactor: animation, child: pages[index])),
        bottomNavigationBar: CustomNavigationBar(
            selectedColor: Colors.indigo[400],
            color: Colors.grey,
            items: navigation,
            currentIndex: index,
            onTap: (navIndex) => setIndex(navIndex)));
  }
}
