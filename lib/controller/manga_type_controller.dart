import 'package:get/get.dart';
import 'package:quizapp/services/api_service.dart';

class MangaTypeController extends GetxController {
  var isLoading = true.obs;
  var mangaList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchManga(String type) async {
    try {
      isLoading(true);
      var dataManga = await ApiService.fetchMangaTypeRecommendation(type);
      mangaList.value = dataManga;
    } finally {
      isLoading(false);
    }
  }
}
