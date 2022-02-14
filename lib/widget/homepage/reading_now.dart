import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizapp/controller/home_premium_controller.dart';
import 'package:quizapp/widget/homepage/list_manga_card.dart';

import 'grid_manga_card.dart';

class ReadingNow extends StatelessWidget {
  ReadingNow({Key? key}) : super(key: key);
  final appData = GetStorage();
  final HomePremiumController homePremiumController =
      Get.put(HomePremiumController(), tag: 'homePremium');

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = appData.read('darkMode');
    bool isGridView = appData.read('gridView');

    return Obx(() {
      if (homePremiumController.isLoading.value) {
        return Center(
          child: SpinKitThreeBounce(
            color: Colors.red,
            size: 50.0,
          ),
        );
      } else {
        return isGridView ? buildGridView(context, isDarkMode) : buildListView(context, isDarkMode);
      }
    });
  }

  ListView buildListView(BuildContext context, bool isDarkMode) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      physics: BouncingScrollPhysics(),
      itemCount: homePremiumController.mangaList.length,
      itemBuilder: (ctx, x) {
        return ListMangaCard(
          context: context,
          data: homePremiumController.mangaList[x],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 2.0,
          color: isDarkMode ? Colors.white.withOpacity(0.5) : Colors.black,
        );
      },
    );
  }

  AlignedGridView buildGridView(BuildContext context, bool isDarkMode) {
    return AlignedGridView.count(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      itemCount: homePremiumController.mangaList.length,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemBuilder: (context, x) {
        return GridMangaCard(
          context: context,
          data: homePremiumController.mangaList[x],
        );
      },
    );
  }
}

// GridView.builder(
// shrinkWrap: true,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// childAspectRatio: (itemWidth / itemHeight),
// mainAxisSpacing: 15,
// crossAxisSpacing: 15,
// crossAxisCount: 2,
// ),
// physics: BouncingScrollPhysics(),
// itemCount: homePremiumController.mangaList.length,
// itemBuilder: (context, x) {
// return MangaCard(
// context: context,
// data: homePremiumController.mangaList[x],
// );
// },
// );
