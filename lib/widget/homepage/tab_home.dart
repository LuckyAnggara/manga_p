import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/tab_home_controller.dart';

class TabHome extends StatelessWidget {
  final TabHomeController _tabX = Get.put(TabHomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: TabBar(
        controller: _tabX.controller,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.amberAccent,
        labelColor: Theme.of(context).textTheme.bodyText1?.color,
        isScrollable: true,
        tabs: List<Widget>.generate(_tabX.tabList.length, (int index) {
          return Tab(
            child: Text(
              _tabX.tabList[index],
              style: TextStyle(fontSize: 16),
            ),
          );
        }),
      ),
    );
  }
}
