import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quizapp/constant.dart';
import 'package:quizapp/models/latest_manga_model.dart';
import 'package:quizapp/widget/bottom_modal_fit.dart';
import 'package:quizapp/widget/bottom_modal_floating.dart';

import '../../../controller/manga_favorites_controller.dart';

class LatestGridMangaCard extends StatelessWidget {
  LatestGridMangaCard({
    Key? key,
    required this.context,
    required this.data,
  }) : super(key: key);

  final BuildContext context;
  final LatestMangaModel data;
  final MangaFavoritesController mangaFavoritesController = Get.find(tag: 'FavoritesController');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.delete(tag: 'homePremium');
        Get.toNamed(
          '/detail/${data.linkId}',
        );
      },
      onLongPress: () => showMaterialModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => FloatingModal(
          child: BottomModalFit(
            readCallBack: () => Get.toNamed(
              '/read/${data.chId}',
            ),
            saveCallBack: () {
              Navigator.of(context).pop();
              mangaFavoritesController.addFavorites(data);
              Get.snackbar('Add to Favorites', '${data.title} has been add to Favorites');
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
            CachedNetworkImage(
              imageUrl: data.image == null || data.image == '' ? data.image! : data.image2!,
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
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.black.withOpacity(0.73),
                child: Text(
                  data.ch!,
                  style: kTitleChapManga,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
