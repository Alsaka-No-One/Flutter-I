import 'package:flutter/material.dart';

class EditField extends StatefulWidget {
  const EditField(
      {required this.label,
      required this.value,
      required this.onSubmit,
      this.getValue,
      Key? key})
      : super(key: key);

  final String label;
  final dynamic value;
  final Function({required dynamic newValue}) onSubmit;
  final String Function(void)? getValue;
  @override
  State<EditField> createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  String getValue() {
    widget.getValue;
    return textEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            widget.onSubmit(
                newValue:
                    (widget.label == "Age" || widget.label == "Street Number")
                        ? int.tryParse(value)
                        : value);
          }
          setState(() {});
        },
        keyboardType: (widget.label == "Age" || widget.label == "Street Number")
            ? const TextInputType.numberWithOptions(decimal: true, signed: true)
            : TextInputType.text,
        focusNode: focusNode,
        cursorColor: Colors.indigo[300],
        maxLines: 1,
        autocorrect: true,
        enableSuggestions: true,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: const BorderSide(color: Colors.indigo, width: 2)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            helperStyle: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).devicePixelRatio * 10),
            helperText: widget.label + '\n',
            contentPadding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).devicePixelRatio * 10),
            suffixIcon: Icon(Icons.edit_rounded,
                color: focusNode.hasFocus == true
                    ? Colors.indigo[300]
                    : Colors.grey[500]),
            hintText:
                (widget.value ?? "Enter your ${widget.label.toLowerCase()}")
                    .toString()));
  }
}
