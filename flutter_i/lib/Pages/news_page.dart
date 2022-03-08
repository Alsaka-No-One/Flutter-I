// import 'dart:ffi';
import 'package:flutter_i/Constants/routes.dart';
import 'package:flutter_i/Controllers/NewsController.dart';
import 'package:flutter_i/Constants/NewsKey.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Consumer<NewsController>(builder: (context, cntrl, child) {
      List list = cntrl.getNewsForFirsTime(1);
      ListView listView = ListView.builder(
          itemCount: list.length,
          itemBuilder: (context2, index) {
            return GestureDetector(
              onTap: () => navigateToTheNewsPage(context, index, cntrl),
              child: Card(
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 100.0,
                      height: 100.0,
                      child: Image.asset(list[index][news_imagePath_key]),
                    ),
                    Expanded(
                        child: Text(
                      list[index][news_title_key],
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                    ))
                  ],
                ),
              ),
            );
          });
      return listView;
    });
  }

  void navigateToTheNewsPage(context, int index, NewsController controller) {
    controller.setTheNewsIndex(index);
    Navigator.of(context).pushNamed(theNewsRoute);
  }
}
