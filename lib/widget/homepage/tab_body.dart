import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/manga_type_controller.dart';
import 'package:quizapp/widget/homepage/type_recommendation.dart';

import '../../controller/tab_home_controller.dart';
import 'reading_now.dart';

class TabBody extends StatelessWidget {
  TabBody({Key? key}) : super(key: key);
  final MangaTypeController mangaTypeController1 = MangaTypeController();
  final MangaTypeController mangaTypeController2 = MangaTypeController();
  final MangaTypeController mangaTypeController3 = MangaTypeController();

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
            TypeRecommendation(
              type: 'manhwa',
              controller: mangaTypeController1,
            ),
            TypeRecommendation(
              type: 'manga',
              controller: mangaTypeController2,
            ),
            TypeRecommendation(
              type: 'manhua',
              controller: mangaTypeController3,
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
