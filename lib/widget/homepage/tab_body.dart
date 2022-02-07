import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/tab_home_controller.dart';
import 'reading_now.dart';

class TabBody extends StatelessWidget {
  const TabBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TabHomeController _tabX = Get.put(
      TabHomeController(),
    );
    return Expanded(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: TabBarView(
          controller: _tabX.controller,
          children: [
            ReadingNow(),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_transit, size: 350),
          ],
        ),
      ),
    );
  }
}
