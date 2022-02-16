import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GeneralBottomModalFit extends StatelessWidget {
  const GeneralBottomModalFit({Key? key, required this.children}) : super(key: key);
  final List<ListTile> children;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
      top: false,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    ));
  }
}
