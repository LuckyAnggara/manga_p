import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/read_controller.dart';
import '../models/read_model.dart';

class ReadPage extends StatelessWidget {
  final ReadController readController = Get.put(ReadController());

  ReadPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    readController.readManga(Get.parameters['linkId']!);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() {
              if (readController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              } else {
                ReadModel data = readController.data.value;

                return ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: data.images!.length,
                  itemBuilder: (context, i) {
                    return CachedNetworkImage(
                      imageUrl: data.images![i],
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    );
                  },
                );
              }
            }),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 15),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
