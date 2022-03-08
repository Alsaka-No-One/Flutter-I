import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_i/Components/edit_field.dart';
import 'package:flutter_i/Components/profile_picture.dart';
import 'package:flutter_i/Controllers/local_storage.dart';
import 'package:flutter_i/Models/location.dart';
import 'package:flutter_i/Models/profile.dart';
import 'package:flutter_i/Utils/dialogs.dart';
import 'package:flutter_i/Widgets/custom_sliver_list.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    ImagePicker imagePicker = ImagePicker();
    ProfileModel profile =
        Provider.of<LocalStorageManager>(context).loadProfile();
    LocationModel location = profile.location;
    Widget header =
        Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      ProfilePicture(
          icon: Icons.add_a_photo_rounded,
          size: 25,
          onTap: () => pickUpImage(imagePicker: imagePicker)),
      GestureDetector(
          onTap: () async {
            await showAlertDialog(context: context, profile: profile);
            setState(() {});
          },
          child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text((profile.username ?? "Username"),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).devicePixelRatio * 15))))
    ]);
    List<EditField> userInfo = [
      EditField(
          label: "Name",
          value: profile.name,
          onSubmit: ({required dynamic newValue}) => setState(
              () => profile.setName(context: context, name: newValue))),
      EditField(
          label: "First Name",
          value: profile.fName,
          onSubmit: ({required dynamic newValue}) => setState(
              () => profile.setfName(context: context, fName: newValue))),
      EditField(
          label: "Email",
          value: profile.email,
          onSubmit: ({required dynamic newValue}) => setState(
              () => profile.setEmail(context: context, email: newValue))),
      EditField(
          label: "Phone Number",
          value: profile.phone,
          onSubmit: ({required dynamic newValue}) => setState(
              () => profile.setPhone(context: context, phone: newValue))),
      EditField(
          label: "Age",
          value: profile.age,
          onSubmit: ({required dynamic newValue}) =>
              setState(() => profile.setAge(context: context, age: newValue))),
    ];
    List<EditField> userLocation = [
      EditField(
          label: "Adress",
          value: location.adress,
          onSubmit: ({required dynamic newValue}) => setState(
              () => location.setAdress(context: context, adress: newValue))),
      EditField(
          label: "Street Number",
          value: location.number,
          onSubmit: ({required dynamic newValue}) => setState(
              () => location.setNumber(context: context, number: newValue))),
      EditField(
          label: "City",
          value: location.city,
          onSubmit: ({required dynamic newValue}) => setState(
              () => location.setCity(context: context, city: newValue))),
      EditField(
          label: "Post Code",
          value: location.area,
          onSubmit: ({required dynamic newValue}) => setState(
              () => location.setArea(context: context, area: newValue))),
      EditField(
          label: "Country",
          value: location.country,
          onSubmit: ({required dynamic newValue}) => setState(
              () => location.setCountry(context: context, country: newValue))),
    ];
    return CustomSliverList(header: header, content: [userInfo, userLocation]);
  }

  void pickUpImage({required ImagePicker imagePicker}) async {
    final XFile? file =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    Provider.of<LocalStorageManager>(context, listen: false).setImage(
        value: await file.readAsBytes().then((value) => base64Encode(value)));
    setState(() {});
  }
}
