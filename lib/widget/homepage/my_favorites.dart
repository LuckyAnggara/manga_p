import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizapp/controller/manga_favorites_controller.dart';
import 'package:quizapp/controller/manga_type_controller.dart';
import 'package:quizapp/widget/homepage/favorites_grid_manga_card.dart';
import 'package:quizapp/widget/homepage/type_list_manga_card.dart';

class MyFavorites extends StatelessWidget {
  final appData = GetStorage();
  final MangaFavoritesController controller = Get.put(MangaFavoritesController());

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = appData.read('darkMode');
    bool isGridView = appData.read('gridView');
    controller.fetchManga();
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: SpinKitThreeBounce(
            color: Colors.red,
            size: 50.0,
          ),
        );
      } else {
        return buildGridView(context, isDarkMode, controller);
      }
    });
  }

  ListView buildListView(BuildContext context, bool isDarkMode, MangaTypeController controller) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: controller.mangaList.length,
      itemBuilder: (ctx, x) {
        return TypeListMangaCard(
          context: context,
          data: controller.mangaList[x],
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

  AlignedGridView buildGridView(
      BuildContext context, bool isDarkMode, MangaFavoritesController controller) {
    return AlignedGridView.count(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      itemCount: controller.mangaList.length,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemBuilder: (context, x) {
        return FavoritesGridMangaCard(
          context: context,
          data: controller.mangaList[x],
        );
      },
    );
  }
}
