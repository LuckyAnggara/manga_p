import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizapp/widget/homepage/type_grid_manga_card.dart';
import 'package:quizapp/widget/homepage/type_list_manga_card.dart';

class TypeRecommendation extends StatelessWidget {
  final appData = GetStorage();

  final List? listManga;

  TypeRecommendation({Key? key, this.listManga}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = appData.read('darkMode');
    bool isGridView = appData.read('gridView');
    return Obx(() {
      // if (listManga.isLoading.value) {
      //   return const Center(
      //     child: SpinKitThreeBounce(
      //       color: Colors.red,
      //       size: 50.0,
      //     ),
      //   );
      // } else {
      return isGridView
          ? buildGridView(context, isDarkMode, listManga!)
          : buildListView(context, isDarkMode, listManga!);
      // }
    });
  }

  ListView buildListView(BuildContext context, bool isDarkMode, List listManga) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: listManga.length,
      itemBuilder: (ctx, x) {
        return TypeListMangaCard(
          context: context,
          data: listManga[x],
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
    BuildContext context,
    bool isDarkMode,
    List listManga,
  ) {
    return AlignedGridView.count(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      physics: BouncingScrollPhysics(),
      crossAxisCount: 2,
      itemCount: listManga.length,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      itemBuilder: (context, x) {
        return TypeGridMangaCard(
          context: context,
          data: listManga[x],
        );
      },
    );
  }
}
