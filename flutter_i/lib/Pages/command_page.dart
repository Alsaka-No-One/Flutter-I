import 'package:flutter/material.dart';

class CommandPage extends StatelessWidget {
  const CommandPage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    ElevatedButton elevatedbutton = ElevatedButton(
        child: const Text("Back"),
        onPressed: () => navigateToMainPage(context));

    Card validation = const Card(
      child: ListTile(
        leading: Icon(
          Icons.check_box,
          color: Colors.green,
          size: 36.0,
        ),
        title: Text("Thanks for your purchasing!"),
        subtitle: Text(
            "You will receive your products before 2 weeks. Check your mail for your invoice"),
      ),
      elevation: 8,
      shadowColor: Colors.blue,
      color: Color.fromARGB(255, 177, 219, 240),
    );

    return Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          Container(
            // height: 200,
            width: 500,
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(20.0),
            child: validation,
          ),
          elevatedbutton
        ]));
  }

  void navigateToMainPage(context) {
    Navigator.of(context).pop();
  }
}
