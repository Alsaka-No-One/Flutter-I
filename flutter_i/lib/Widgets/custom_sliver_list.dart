import 'package:flutter/material.dart';

class CustomSliverList extends StatefulWidget {
  const CustomSliverList(
      {required this.header, required this.content, Key? key})
      : super(key: key);

  final Widget header;
  final List<List<Widget>> content;
  @override
  State<CustomSliverList> createState() => _CustomSliverListState();
}

class _CustomSliverListState extends State<CustomSliverList>
    with TickerProviderStateMixin {
  late final TabController tabController;
  List<Widget> selectedWidgets = [];
  @override
  void initState() {
    selectedWidgets = widget.content[0];
    tabController = TabController(
        length: 2,
        vsync: this,
        animationDuration: const Duration(milliseconds: 300));
    tabController.addListener(() => tabListener());
    super.initState();
  }

  void tabListener() {
    if (tabController.indexIsChanging) {
      setState(() => selectedWidgets = widget.content[tabController.index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    IconButton backButton = IconButton(
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          size: MediaQuery.of(context).devicePixelRatio * 15,
          color: Colors.white,
        ));

    return CustomScrollView(slivers: [
      SliverAppBar(
          leading: backButton,
          pinned: true,
          floating: true,
          backgroundColor: Colors.indigo[300],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
          toolbarHeight: MediaQuery.of(context).devicePixelRatio * 75,
          collapsedHeight: MediaQuery.of(context).devicePixelRatio * 75,
          centerTitle: true,
          title: widget.header,
          bottom: TabBar(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).devicePixelRatio),
            labelPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).devicePixelRatio * 5),
            indicatorColor: Colors.white,
            indicatorPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).devicePixelRatio * 25),
            tabs: [
              Text("User Infos",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).devicePixelRatio * 10)),
              Text("User Location",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).devicePixelRatio * 10))
            ],
            controller: tabController,
          ),
          automaticallyImplyLeading: false),
      SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).devicePixelRatio * 8,
                      vertical: MediaQuery.of(context).devicePixelRatio * 2),
                  child: Card(
                    key: ObjectKey(selectedWidgets[index]),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                            bottom: Radius.circular(15))),
                    color: Colors.indigo[300],
                    child: selectedWidgets[index],
                    borderOnForeground: false,
                  )),
              childCount: selectedWidgets.length))
    ]);
  }
}
