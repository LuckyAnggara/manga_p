import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/models/search_model.dart';

import '../../constant.dart';

class MangaCardSearch extends StatelessWidget {
  const MangaCardSearch({
    Key? key,
    required this.context,
    required this.data,
  }) : super(key: key);

  final BuildContext context;
  final SearchModel data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        '/detail/${data.linkId}',
      ),
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
                data.chapter!,
                style: kTitleChapManga,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
