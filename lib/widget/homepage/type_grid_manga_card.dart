import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:quizapp/models/manga_type_model.dart';

import '../../constant.dart';
import '../../models/home_premium_model.dart';
import '../bottom_modal_fit.dart';
import '../bottom_modal_floating.dart';

class TypeGridMangaCard extends StatelessWidget {
  const TypeGridMangaCard({
    Key? key,
    required this.context,
    required this.data,
  }) : super(key: key);

  final BuildContext context;
  final MangaTypeModel data;

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
        builder: (context) => FloatingModal(
          child: BottomModalFit(
            readCallBack: () => Get.toNamed(
              '/detail/${data.linkId}',
            ),
            saveCallBack: () {},
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
                imageUrl: data.image == null || data.image == ''
                    ? data.image!
                    : data.image2!,
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
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
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
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.black.withOpacity(0.73),
                child: Text(
                  data.isCompleted == 'Completed' ? 'Completed' : 'Ongoing'!,
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
