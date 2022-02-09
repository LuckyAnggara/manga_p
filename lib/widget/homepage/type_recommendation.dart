import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizapp/controller/manga_type_controller.dart';
import 'package:quizapp/widget/homepage/type_grid_manga_card.dart';
import 'package:quizapp/widget/homepage/type_list_manga_card.dart';

class TypeRecommendation extends StatelessWidget {
  TypeRecommendation({
    Key? key,
    required this.type,
    required this.controller,
  }) : super(key: key);
  final appData = GetStorage();
  final MangaTypeController controller;
  final String type;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = appData.read('darkMode');
    bool isGridView = appData.read('homeView');
    controller.fetchManga(type);
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return isGridView
            ? buildGridView(context, isDarkMode, controller)
            : buildListView(context, isDarkMode, controller);
      }
    });
  }

  ListView buildListView(
      BuildContext context, bool isDarkMode, MangaTypeController controller) {
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
      BuildContext context, bool isDarkMode, MangaTypeController controller) {
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
        return TypeGridMangaCard(
          context: context,
          data: controller.mangaList[x],
        );
      },
    );
  }
}
