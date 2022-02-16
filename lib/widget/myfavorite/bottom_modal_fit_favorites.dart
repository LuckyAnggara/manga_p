import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomModalFitFavorites extends StatelessWidget {
  const BottomModalFitFavorites(
      {Key? key, required this.readCallBack, required this.deleteCallBack})
      : super(key: key);
  final VoidCallback readCallBack;
  final VoidCallback deleteCallBack;

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
          children: <Widget>[
            ListTile(
              title: Text('Read'),
              leading: Icon(FontAwesomeIcons.readme),
              onTap: readCallBack,
            ),
            ListTile(
              title: Text('Delete From Favorites'),
              leading: Icon(Icons.delete),
              onTap: deleteCallBack,
            ),
          ],
        ),
      ),
    ));
  }
}
