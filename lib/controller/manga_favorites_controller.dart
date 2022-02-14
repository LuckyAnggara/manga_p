import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MangaFavoritesController extends GetxController {
  var isLoading = true.obs;
  var mangaList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void fetchManga() async {
    mangaList.value = [];
    var box = Hive.box('myBox');

    try {
      isLoading(true);
      for (var i = 0; i < box.length; i++) {
        var dataManga = await box.getAt(i);
        mangaList.value.add(dataManga);
      }
    } finally {
      isLoading(false);
    }
  }
}
