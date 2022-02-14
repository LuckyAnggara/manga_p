import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                return Center(
                  child: SpinKitThreeBounce(
                    color: Colors.red,
                    size: 50.0,
                  ),
                );
              } else {
                ReadModel data = readController.data.value;
                return ListView.builder(
                  // controller: readController.listViewController,
                  physics: BouncingScrollPhysics(),
                  itemCount: data.images!.length,
                  itemBuilder: (context, i) {
                    return ExtendedImage.network(
                      data.images![i],
                      fit: BoxFit.cover,
                      //enableLoadState: false,
                      mode: ExtendedImageMode.gesture,
                      cache: true,
                      initGestureConfigHandler: (state) {
                        return GestureConfig(
                          minScale: 1,
                          animationMinScale: 1,
                          maxScale: 1.5,
                          animationMaxScale: 2,
                          speed: 1.0,
                          inertialSpeed: 100.0,
                          initialScale: 1.0,
                          inPageView: false,
                          initialAlignment: InitialAlignment.center,
                        );
                      },
                    );
                    return CachedNetworkImage(
                      imageUrl: data.images![i],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: SpinKitThreeBounce(
                          color: Colors.red,
                          size: 50.0,
                        ),
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
                    color: Get.theme.scaffoldBackgroundColor,
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
