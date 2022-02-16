import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp/services/api_service.dart';

class LatestController extends GetxController {
  var isLoading = true.obs;
  var isLoadMore = false.obs;
  List mangaList = [].obs;
  ScrollController controller = ScrollController();
  var i = 1;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchManga();
    loadMore();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void fetchManga() async {
    try {
      isLoading(true);
      var dataManga = await ApiService.fetchLatestManga(i);
      mangaList.addAll(dataManga);
      i++;
    } finally {
      isLoading(false);
    }
  }

  void loadMore() async {
    controller.addListener(() async {
      if (controller.position.maxScrollExtent == controller.position.pixels) {
        isLoadMore(true);
        await ApiService.fetchLatestManga(i).then((value) {
          isLoadMore(false);
          mangaList.addAll(value);
          i++;
          print(i);
        });
      }
    });
  }
}
