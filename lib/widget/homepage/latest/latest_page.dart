import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizapp/controller/latest_controller.dart';
import 'package:quizapp/widget/homepage/latest/latest_grid_manga_card.dart';
import 'package:quizapp/widget/homepage/latest/latest_list_manga_card.dart';

class LatestPage extends StatelessWidget {
  LatestPage({Key? key}) : super(key: key);
  final appData = GetStorage();
  final LatestController latestController = Get.find(tag: 'latestController');

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = appData.read('darkMode');
    bool isGridView = appData.read('gridView');
    return Obx(() {
      if (latestController.isLoading.value) {
        return const Center(
          child: SpinKitThreeBounce(
            color: Colors.red,
            size: 50.0,
          ),
        );
      } else {
        return Stack(
          children: [
            AbsorbPointer(
              absorbing: latestController.isLoadMore.value == true ? true : false,
              child: Opacity(
                  opacity: latestController.isLoadMore.value == true ? 0.7 : 1,
                  child: isGridView
                      ? buildGridView(context, isDarkMode)
                      : buildListView(context, isDarkMode)),
            ),
            latestController.isLoadMore.value == true
                ? const Center(
                    child: SpinKitThreeBounce(
                      color: Colors.red,
                      size: 50.0,
                    ),
                  )
                : const SizedBox(),
          ],
        );
      }
    });
  }

  ListView buildListView(BuildContext context, bool isDarkMode) {
    return ListView.separated(
      controller: latestController.controller,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: latestController.mangaList.length,
      itemBuilder: (ctx, x) {
        return LatestListMangaCard(
          context: context,
          data: latestController.mangaList[x],
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
      controller: latestController.controller,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      physics: const BouncingScrollPhysics(),
      crossAxisCount: 2,
      itemCount: latestController.mangaList.length,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemBuilder: (context, x) {
        return LatestGridMangaCard(
          context: context,
          data: latestController.mangaList[x],
        );
      },
    );
  }
}
