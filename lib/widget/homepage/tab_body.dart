import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/manga_type_controller.dart';
import 'package:quizapp/widget/homepage/my_favorites.dart';
import 'package:quizapp/widget/homepage/type_recommendation.dart';

import '../../controller/tab_home_controller.dart';
import 'latest/latest_page.dart';
import 'reading_now.dart';

class TabBody extends StatelessWidget {
  TabBody({Key? key}) : super(key: key);

  final TabHomeController _tabX = Get.put(
    TabHomeController(),
  );
  final MangaTypeController _mangaTypeController = Get.find(tag: 'TypeMangaController');
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
            LatestPage(),
            TypeRecommendation(
              listManga: _mangaTypeController.mangaListManhwa,
            ),
            TypeRecommendation(
              listManga: _mangaTypeController.mangaListManga,
            ),
            TypeRecommendation(
              listManga: _mangaTypeController.mangaListManhua,
            ),
            MyFavorites()
          ],
        ),
      ),
    );
  }
}
