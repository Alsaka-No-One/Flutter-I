import 'package:flutter/material.dart';
import 'package:flutter_i/Pages/command_page.dart';

class CommandRoute extends StatelessWidget {
  const CommandRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CommandPage());
  }
}
