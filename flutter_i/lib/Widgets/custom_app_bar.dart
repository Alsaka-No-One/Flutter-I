import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  final String title;
  final IconData icon;
  final Function(BuildContext context) onTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: TextStyle(
              color: Colors.indigo[400],
              fontSize: MediaQuery.of(context).devicePixelRatio * 15)),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey[200]!),
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(15))),
      leadingWidth: MediaQuery.of(context).size.width * 0.2,
      leading: IconButton(
          icon: Icon(
            icon,
            color: Colors.indigo[400],
            size: MediaQuery.of(context).devicePixelRatio * 15,
          ),
          onPressed: () => onTap(context)),
      automaticallyImplyLeading: false,
      elevation: 5,
      backgroundColor: Colors.white,
    );
  }
}
