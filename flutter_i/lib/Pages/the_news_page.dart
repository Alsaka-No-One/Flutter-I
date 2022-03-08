import 'package:flutter/material.dart';
import 'package:flutter_i/Controllers/NewsController.dart';
import 'package:provider/provider.dart';

class TheNewsPage extends StatelessWidget {
  const TheNewsPage({Key? key}) : super(key: key);

  @override
  build(BuildContext context) {
    return Consumer<NewsController>(builder: (context, cntrl, child) {
      return Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    cntrl.getTheNewsTitle(),
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Text(cntrl.getTheNewsContent())
            ],
          ),
          Align(
              alignment: Alignment.topLeft,
              child: GestureDetector(
                child:
                    const Icon(Icons.arrow_back, color: Colors.black, size: 25),
                onTap: () => navigateToMainPage(context),
              )),
        ],
      );
    });
  }

// Container(
//         child: Stack(
//           children: [
  // Align(
  //     alignment: Alignment.bottomLeft,
  //     child: GestureDetector(
  //       child: const Icon(Icons.arrow_back,
  //           color: Colors.black, size: 25),
  //       onTap: () => navigateToMainPage(context),
  //     )),
//             Expanded(child: Text(cntrl.getTheNewsContent())),
//           ],
//         ),
//       )
// Text(cntrl.getTheNewsContent())
// GestureDetector(
//                   child: const Icon(Icons.arrow_back,
//                       color: Colors.black, size: 25),
//                   onTap: () => navigateToMainPage(context),
//                 )
  void navigateToMainPage(context) {
    Navigator.of(context).pop();
  }
}
