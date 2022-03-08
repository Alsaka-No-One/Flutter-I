import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i/Components/edit_field.dart';
import 'package:flutter_i/Models/profile.dart';
import 'package:flutter_i/Widgets/custom_alert_dialog.dart';

Future<void> showAlertDialog(
    {required BuildContext context, required ProfileModel profile}) async {
  await showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => CustomAlertDialog(
          title: "Edit username",
          actions: const [],
          content: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25), bottom: Radius.circular(15))),
            color: Colors.indigo[300],
            child: EditField(
                label: "Username",
                value: profile.username,
                onSubmit: ({required dynamic newValue}) =>
                    profile.setUsername(context: context, username: newValue)),
            borderOnForeground: false,
          )));
}
