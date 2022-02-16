import 'package:get/get.dart';
import 'package:quizapp/services/api_service.dart';

class MangaTypeController extends GetxController {
  var isLoading = true.obs;
  var mangaListManhwa = [].obs;
  var mangaListManga = [].obs;
  var mangaListManhua = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchManga('manhwa');
    fetchManga('manga');
    fetchManga('manhua');
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
      if (type == 'manhwa') {
        mangaListManhwa.value = dataManga;
      } else if (type == 'manga') {
        mangaListManga.value = dataManga;
      } else {
        mangaListManhua.value = dataManga;
      }
    } finally {
      isLoading(false);
    }
  }
}
