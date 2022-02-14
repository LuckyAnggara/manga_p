import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/widget/homepage/my_favorites.dart';
import 'package:quizapp/widget/homepage/type_recommendation.dart';

import '../../controller/tab_home_controller.dart';
import 'reading_now.dart';

class TabBody extends StatelessWidget {
  TabBody({Key? key}) : super(key: key);

  final TabHomeController _tabX = Get.put(
    TabHomeController(),
  );
  @override
  Widget build(BuildContext context) {
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
            TypeRecommendation(
              type: 'manhwa',
            ),
            TypeRecommendation(
              type: 'manga',
            ),
            TypeRecommendation(
              type: 'manhua',
            ),
            MyFavorites()
          ],
        ),
      ),
    );
  }
}
