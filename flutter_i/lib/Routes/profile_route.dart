import 'package:flutter/material.dart';
import 'package:flutter_i/Pages/profile_page.dart';

class ProfileRoute extends StatelessWidget {
  const ProfileRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ProfilePage());
  }
}
