import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quizapp/controller/manga_favorites_controller.dart';
import 'package:quizapp/widget/homepage/favorites_grid_manga_card.dart';
import 'package:quizapp/widget/homepage/favorites_list_manga_card.dart';

import '../bottom_modal_floating.dart';
import '../general_bottom_modal_fit.dart';

class MyFavorites extends StatelessWidget {
  final appData = GetStorage();
  final MangaFavoritesController controller = Get.find(tag: 'FavoritesController');

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = appData.read('darkMode');
    bool isGridView = appData.read('gridView');
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const Center(
            child: SpinKitThreeBounce(
              color: Colors.red,
              size: 50.0,
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.mangaList.length > 0
                  ? Container(
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      height: Get.height * .04,
                      // color: Colors.white,
                      child: TextButton(
                        onPressed: () => showMaterialModalBottomSheet(
                          expand: false,
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) => FloatingModal(
                            child: GeneralBottomModalFit(
                              children: [
                                ListTile(
                                  title: Text('Confirm'),
                                  leading: Icon(FontAwesomeIcons.checkDouble),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    controller.clearAll();
                                    Get.snackbar(
                                      'Clear Favorites',
                                      'Data Favorites has Been Deleted',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: Colors.white,
                                      colorText: Colors.black,
                                    );
                                  },
                                ),
                                ListTile(
                                  title: Text('Cancel'),
                                  leading: Icon(Icons.close),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                8,
                              ),
                            ),
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                        child: Text(
                          'Clear All',
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    )
                  : Container(),
              Expanded(
                  child: isGridView
                      ? buildGridView(context, isDarkMode, controller)
                      : buildListView(context, isDarkMode, controller)),
            ],
          );
        }
      },
    );
  }

  ListView buildListView(
      BuildContext context, bool isDarkMode, MangaFavoritesController controller) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: controller.mangaList.length,
      itemBuilder: (ctx, x) {
        return FavoritesListMangaCard(
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
