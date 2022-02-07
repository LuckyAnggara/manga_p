import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/controller/detail_controller.dart';
import 'package:quizapp/views/home_page.dart';

import '../models/detail_model.dart';
import '../widget/detailpage/chapter_list.dart';

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
                      Get.off(() => HomePage());
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                  const Icon(
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
                              padding: const EdgeInsets.only(right: 10),
                              width: size.width / 2 - 20,
                              child: Hero(
                                tag: data.linkId!,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      data.image == null || data.image == ''
                                          ? data.image!
                                          : data.image2!,
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
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
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              width: size.width / 2 - 20,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      data.title!,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.color,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'Author ',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.color,
                                          fontSize: 10),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: data.author!,
                                          style: const TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 12,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    height: 20,
                                    width: double.infinity,
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      child: Wrap(
                                        children: List.generate(
                                          data.genres!.length,
                                          (index) {
                                            return Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 2,
                                                horizontal: 4,
                                              ),
                                              width: 80,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.teal,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(
                                                    12,
                                                  ),
                                                ),
                                              ),
                                              margin: const EdgeInsets.only(
                                                  right: 10, bottom: 4),
                                              child: Text(
                                                data.genres![index],
                                                style: const TextStyle(
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
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Text(
                                        data.synopsis!,
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              ?.color,
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
                      const SizedBox(
                        height: 20,
                      ),
                      ChapterList(size: size, data: data),
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
