import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i/Controllers/local_storage.dart';
import 'package:provider/provider.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture(
      {required this.size, required this.icon, required this.onTap, Key? key})
      : super(key: key);

  final Function()? onTap;
  final IconData icon;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Consumer<LocalStorageManager>(
        builder: (context, local, child) => GestureDetector(
            onTap: onTap,
            child: Container(
                width: MediaQuery.of(context).devicePixelRatio * 45,
                height: MediaQuery.of(context).devicePixelRatio * 45,
                decoration: BoxDecoration(
                    image: local.getImage() != null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: MemoryImage(base64Decode(local.getImage()!)))
                        : null,
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(105),
                    border: Border.all(color: Colors.red[200]!)),
                child: local.getImage() == null
                    ? Icon(icon,
                        color: Colors.grey[600],
                        size: MediaQuery.of(context).devicePixelRatio * size)
                    : null)));
  }
}
