import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quizapp/widget/myfavorite/bottom_modal_floating_favorites.dart';

import '../../models/favorite_manga_model.dart';
import '../myfavorite/bottom_modal_fit_favorites.dart';

class FavoritesListMangaCard extends StatelessWidget {
  const FavoritesListMangaCard({
    Key? key,
    required this.context,
    required this.data,
  }) : super(key: key);

  final BuildContext context;
  final FavoriteMangaModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        '/detail/${data.linkId}',
      ),
      onLongPress: () => showMaterialModalBottomSheet(
        expand: false,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => FloatingModalFavorites(
          child: BottomModalFitFavorites(
            readCallBack: () => Get.toNamed(
              '/detail/${data.linkId}',
            ),
            deleteCallBack: () {},
          ),
        ),
      ),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: data.image!,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black.withOpacity(0.5)),
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
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              SizedBox(
                width: 18,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Text(
                    //   data.rating!,
                    //   style: TextStyle(
                    //     fontSize: 14,
                    //   ),
                    //   textAlign: TextAlign.left,
                    // ),
                    SizedBox(
                      height: 5,
                    ),
                    // Text(
                    //   data.isCompleted == 'Completed' ? 'Completed' : 'Ongoing',
                    //   style: TextStyle(
                    //     fontWeight: FontWeight.normal,
                    //     fontSize: 12,
                    //   ),
                    //   textAlign: TextAlign.left,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
