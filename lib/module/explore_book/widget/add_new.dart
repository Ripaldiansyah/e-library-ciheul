// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class AddNew extends StatefulWidget {
  const AddNew({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final Function onPressed;

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed();
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2.3,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
