import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {Key? key,
      required this.title,
      required this.actions,
      required this.content})
      : super(key: key);

  final String title;
  final List<Widget> actions;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        title: Text(title),
        content: content,
        actions: actions);
  }
}
