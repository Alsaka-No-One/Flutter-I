import 'package:flutter/material.dart';
import 'package:flutter_i/Controllers/ItemController.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text("Search");

  final textController = TextEditingController();
  List _list = [];
  String _filter = "";

  @override
  void initState() {
    super.initState();

    textController.addListener(() {
      _filter = textController.text;
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void setList(list) {
    if (_list.isEmpty) {
      _list.addAll(list);
    }
  }

  void setListWithFilter(list, filter) {
    List temp = [];
    temp.addAll(list);
    if (filter.isNotEmpty) {
      List newList = [];
      for (int i = 0; i != temp.length; i++) {
        if (temp[i]["name"].contains(filter)) {
          newList.add(temp[i]);
        }
      }
      setState(() {
        _list.clear();
        _list.addAll(newList);
      });
    } else if (filter == "") {
      setState(() {
        _list.clear();
        _list.addAll(temp);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemController>(builder: (context, cntrl, child) {
      setList(cntrl.getItemsForFirsTime(1));
      return Scaffold(
          appBar: AppBar(
            title: customSearchBar,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    if (customIcon.icon == Icons.search) {
                      customIcon = const Icon(Icons.cancel);
                      customSearchBar = ListTile(
                          leading: const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 28,
                          ),
                          title: TextField(
                              controller: textController,
                              onChanged: (value) {
                                setListWithFilter(cntrl.getItems(1), value);
                              },
                              decoration: const InputDecoration(
                                hintText: 'Do your reasearch',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontStyle: FontStyle.italic,
                                ),
                                border: InputBorder.none,
                              ),
                              style: const TextStyle(
                                color: Colors.white,
                              )));
                    } else {
                      customIcon = const Icon(Icons.search);
                      customSearchBar = const Text("Search");
                    }
                  });
                },
                icon: customIcon,
              )
            ],
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return Container(
                child: Column(children: [
                  Text(
                    _list[index]["name"] +
                        " " +
                        _list[index]["price"].toString() +
                        _list[index]["device"],
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 30),
                  ),
                  Container(
                      child: Image.asset(_list[index]["imagePath"], scale: 5)),
                  ElevatedButton(
                    child: Text("Remaining = " +
                        _list[index]["stock"].toString() +
                        " | Add To Cart"),
                    onPressed: () {
                      int i = 0;
                      for (;
                          _list[index]["name"] != cntrl.getItems(1)[i]["name"];
                          i++) {}
                      cntrl.addToCart(i);
                    },
                  )
                ]),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 5)),
                width: double.infinity,
              );
            },
          ));
    });
  }
}
