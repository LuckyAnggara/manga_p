import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quizapp/models/favorite_manga_model.dart';
import 'package:quizapp/widget/myfavorite/bottom_modal_fit_favorites.dart';

import '../../constant.dart';
import '../../controller/manga_favorites_controller.dart';
import '../myfavorite/bottom_modal_floating_favorites.dart';

class FavoritesGridMangaCard extends StatelessWidget {
  FavoritesGridMangaCard({
    Key? key,
    required this.context,
    required this.data,
  }) : super(key: key);

  final BuildContext context;
  final FavoriteMangaModel data;

  final MangaFavoritesController mangaFavoritesController = Get.find(tag: 'FavoritesController');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/detail/${data.linkId}',
        );
      },
      onLongPress: () => showMaterialModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => FloatingModalFavorites(
          child: BottomModalFitFavorites(
            readCallBack: () => Get.toNamed(
              '/detail/${data.linkId}',
            ),
            deleteCallBack: () {
              mangaFavoritesController.deleteManga(data.linkId);
            },
          ),
        ),
      ),
      child: SizedBox(
        height: 250,
        width: 80,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Hero(
              tag: data.linkId!,
              child: CachedNetworkImage(
                imageUrl: data.image!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        12,
                      ),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              left: 10,
              child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.black.withOpacity(0.73),
                child: Text(
                  data.title!,
                  style: kTitleManga,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
