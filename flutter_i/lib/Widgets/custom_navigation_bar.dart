import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar(
      {Key? key,
      required this.items,
      required this.onTap,
      required this.currentIndex,
      this.color,
      this.selectedColor})
      : super(key: key);

  final Color? color;
  final Color? selectedColor;
  final int currentIndex;
  final List<IconData> items;
  final Function onTap;

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  late int index;

  @override
  void initState() {
    index = widget.currentIndex;
    super.initState();
  }

  bool isCurrent(IconData e) {
    return widget.items.indexWhere((element) => element == e) ==
        widget.currentIndex;
  }

  void setCurrent(IconData e) {
    setState(() {
      index = widget.items.indexWhere((element) => element == e);
    });
    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.02,
            horizontal: MediaQuery.of(context).size.width * 0.03),
        child: Container(
            alignment: Alignment.center,
            child: Row(
                children: widget.items.map((e) {
                  Widget icon = AnimatedScale(
                      scale: MediaQuery.of(context).devicePixelRatio *
                          (isCurrent(e) ? 0.8 : 0.6),
                      duration: const Duration(milliseconds: 300),
                      child: Icon(e,
                          color: isCurrent(e)
                              ? widget.selectedColor
                              : widget.color));
                  return GestureDetector(
                      child: Container(
                          child: icon,
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.015)),
                      onTap: () => setCurrent(e));
                }).toList(),
                mainAxisAlignment: MainAxisAlignment.spaceAround),
            height: MediaQuery.of(context).devicePixelRatio * 28,
            decoration: BoxDecoration(
                color: Colors.grey[50],
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 1), blurRadius: 2)
                ],
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: Colors.black45, width: 0.2))));
  }
}
