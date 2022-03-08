import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Controllers/ItemController.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Consumer<ItemController>(builder: (context, cntrl, child) {
      List selectedItem = getListSelectedItem(cntrl);
      Text totalPrice = Text("Total = ${getTotalPrice(selectedItem)}\$");

      ElevatedButton elevatedbutton = ElevatedButton(
          child: const Text("Validate Order"),
          onPressed: () => navigateToCommandPage(context, cntrl));

      return Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            selectedItem.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: selectedItem.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: Text(
                                  "Selection: ${selectedItem[index]["name"]}"),
                              title: Text(
                                  "Quantity: ${selectedItem[index]["quantity"]}"),
                              subtitle: Text(
                                  "Unit price: ${selectedItem[index]["price"]}\$"),
                              trailing: IconButton(
                                  onPressed: () =>
                                      removeItem(selectedItem, cntrl, index),
                                  icon: const Icon(Icons.highlight_remove)),
                            ),
                          );
                        }))
                : const Expanded(
                    child: Center(
                    child: ListTile(
                      leading: Icon(Icons.not_interested,
                          color: Colors.red, size: 36.0),
                      title: Text("There is no item in the cart"),
                      subtitle: Text("Go to the main page to chose products"),
                    ),
                  )),
            totalPrice,
            elevatedbutton
          ]));
    });
  }

  List getListSelectedItem(cntrl) {
    List selectedItem = [];
    List items = cntrl.getItems(1);

    for (int i = 0; i != items.length; i++) {
      if (items[i]["inCart"] > 0) {
        selectedItem.add({
          "id": items[i]["id"],
          "name": items[i]["name"],
          "quantity": items[i]["inCart"].toString(),
          "price": items[i]["price"].toString()
        });
      }
    }
    return selectedItem;
  }

  void removeItem(selectedItem, cntrl, index) {
    String id = selectedItem[index]["id"];
    int i = 0;

    for (; id != cntrl.getItems(1)[i]["id"]; i++) {}
    cntrl.removeFromCart(i);
  }

  String getTotalPrice(selectedItem) {
    int totalPrice = 0;

    for (int i = 0; i != selectedItem.length; i++) {
      totalPrice += int.parse(selectedItem[i]["price"]) *
          int.parse(selectedItem[i]["quantity"]);
    }
    return totalPrice.toString();
  }

  void navigateToCommandPage(context, cntrl) {
    cntrl.buyItems(1);
    Navigator.of(context).pushNamed('/command');
  }
}
