import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/detail_controller.dart';
import 'package:quizapp/views/home_page.dart';

import '../models/detail_model.dart';

class DetailPage extends StatelessWidget {
  DetailPage({Key? key}) : super(key: key);
  final DetailController detailController = Get.put(DetailController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    detailController.fetchDetail(Get.parameters['linkId']!);

    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.off(()=>HomePage());
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                  Icon(
                    Icons.more_vert,
                    size: 24,
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                if (detailController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  DetailModel data = detailController.detail.value;
                  return Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: size.height * 0.35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              width: size.width / 2 - 40,
                              child: CachedNetworkImage(
                                imageUrl: data.image == null || data.image == ''
                                    ? data.image!
                                    : data.image2!,
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                        12,
                                      ),
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    Center(child: const CircularProgressIndicator()),
                                errorWidget: (context, url, error) => const Icon(Icons.error),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              width: size.width / 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      data.title!,
                                      style: TextStyle(
                                        color: Theme.of(context).textTheme.bodyText1?.color,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Author ',
                                        style: TextStyle(
                                            color: Theme.of(context).textTheme.bodyText1?.color,
                                            fontSize: 10),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: data.author!,
                                            style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 20,
                                    width: double.infinity,
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Wrap(
                                        children: List.generate(
                                          data.genres!.length,
                                          (index) {
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 2,
                                                horizontal: 4,
                                              ),
                                              width: 80,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.teal),
                                                borderRadius: const BorderRadius.all(
                                                  Radius.circular(
                                                    12,
                                                  ),
                                                ),
                                              ),
                                              margin: EdgeInsets.only(right: 10, bottom: 4),
                                              child: Text(
                                                data.genres![index],
                                                style: TextStyle(
                                                  color: Colors.teal,
                                                  fontSize: 9,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
                                      child: Text(
                                        data.synopsis!,
                                        style: TextStyle(
                                          color: Theme.of(context).textTheme.bodyText1?.color,
                                          fontSize: 12,
                                        ),
                                        textAlign: TextAlign.justify,
                                        softWrap: true,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.1)),
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        height: size.height * 0.50,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: data.listChapter!.length,
                          itemBuilder: (context, i) {
                            return Container(
                              decoration: i == 0
                                  ? BoxDecoration(color: Colors.teal.withOpacity(0.1))
                                  : null,
                              height: 70,
                              padding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 18,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.toNamed(
                                      '/read/${data.listChapter![i].linkId}',
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Chapter ${data.listChapter![i].ch!}',
                                              style: TextStyle(
                                                color: Theme.of(context).textTheme.bodyText1?.color,
                                                fontSize: 14,
                                                fontWeight:
                                                    i == 0 ? FontWeight.bold : FontWeight.normal,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            i == 0
                                                ? Text(
                                                    'New',
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.bold),
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text('Release : ${data.listChapter![i].timeRelease!}'),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    size: 24,
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
