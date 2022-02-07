import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/home_premium_controller.dart';

import 'manga_card.dart';

class ReadingNow extends StatelessWidget {
  ReadingNow({Key? key}) : super(key: key);

  final HomePremiumController homePremiumController = Get.put(HomePremiumController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - 180) / 2;
    final double itemWidth = size.width / 2;
    return Obx(() {
      if (homePremiumController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: (itemWidth / itemHeight),
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            crossAxisCount: 2,
          ),
          physics: BouncingScrollPhysics(),
          itemCount: homePremiumController.mangaList.length,
          itemBuilder: (context, x) {
            return MangaCard(
              context: context,
              data: homePremiumController.mangaList[x],
            );
          },
        );
      }
    });
  }
}
