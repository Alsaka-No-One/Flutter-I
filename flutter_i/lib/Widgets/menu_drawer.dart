import 'package:flutter/material.dart';
import 'package:flutter_i/Components/drawer_header.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Container profileBox = Container(
      child: const CustomDrawerHeader(),
      height: MediaQuery.of(context).devicePixelRatio * 100,
      decoration: BoxDecoration(
          color: Colors.indigo[300],
          borderRadius: const BorderRadius.only(topRight: Radius.circular(50))),
    );
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height,
        child: Drawer(
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(50))),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [profileBox],
            )));
  }
}
