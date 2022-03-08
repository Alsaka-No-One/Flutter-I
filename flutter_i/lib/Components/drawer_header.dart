import 'package:flutter/material.dart';
import 'package:flutter_i/Components/profile_picture.dart';
import 'package:flutter_i/Constants/routes.dart';
import 'package:flutter_i/Controllers/local_storage.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Consumer<LocalStorageManager> local = Consumer(
        builder: (context, local, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text("Hi ${local.getUserName() ?? ""}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize:
                                MediaQuery.of(context).devicePixelRatio * 10))),
                GestureDetector(
                    onTap: () => navigateToProfileRoute(context),
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).devicePixelRatio * 2,
                            horizontal:
                                MediaQuery.of(context).devicePixelRatio * 3),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[100]!),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text("Edit your profile ->",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).devicePixelRatio *
                                        6))))
              ],
            ));
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      ProfilePicture(
          onTap: () => navigateToProfileRoute(context),
          icon: Icons.person_rounded,
          size: 35),
      SizedBox(
          height: MediaQuery.of(context).devicePixelRatio * 65, child: local)
    ]);
  }

  void navigateToProfileRoute(context) {
    Navigator.of(context).pushNamed(profileRoute);
  }
}
