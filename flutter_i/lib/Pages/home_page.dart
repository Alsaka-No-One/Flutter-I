import 'package:flutter/material.dart';
import 'package:flutter_i/Controllers/ItemController.dart';
import 'package:provider/provider.dart';

import '../Models/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  build(BuildContext context) {
    return Consumer<ItemController>(builder: (context, cntrl, child) {
      List list = cntrl.getItemsForFirsTime(1);
      ListView listView = ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
      
      
      return Container(
        child: Column(children: [
          Text(
            cntrl.getItems(1)[index]["name"] +
                " " +
                cntrl.getItems(1)[index]["price"].toString() +
                cntrl.getItems(1)[index]["device"],
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
          ),
          Container(
              child: Image.asset(cntrl.getItems(1)[index]["imagePath"], scale: 5)),
          ElevatedButton(
              child: Text("Remaining = " +
                  cntrl.getItems(1)[index]["stock"].toString() +
                  " | Add To Cart"),
              onPressed: () => cntrl.addToCart(index))
        ]),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.red, width: 5)),
        width: double.infinity,
      );}
      );
  return Center(
          child: listView);
    });}

}
