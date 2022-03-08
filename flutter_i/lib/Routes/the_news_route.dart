import 'package:flutter/material.dart';
import 'package:flutter_i/Pages/the_news_page.dart';

class TheNewsRoute extends StatelessWidget {
  const TheNewsRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: TheNewsPage()));
  }
}
