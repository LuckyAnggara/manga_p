import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onPress;
  SearchBar({
    Key? key,
    this.controller,
    this.onPress,
  }) : super(key: key);

  final appData = GetStorage();

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = appData.read('darkMode');
    return Container(
      margin: EdgeInsets.only(
        right: 5,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5),
      height: 50.0,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: isDarkMode ? Colors.white : Colors.black,
      ),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        style: TextStyle(color: isDarkMode ? Colors.black : Colors.white, fontSize: 18),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: isDarkMode ? Colors.black54 : Colors.white54,
          ),
          hintText: "Search ... ",
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.search,
              color: isDarkMode ? Colors.black : Colors.white,
            ),
            onPressed: onPress,
            iconSize: 30.0,
          ),
        ),
        onChanged: null,
        onSubmitted: null,
      ),
    );
  }
}
