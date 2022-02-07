import 'package:get/get.dart';
import 'package:quizapp/services/api_service.dart';

class SearchController extends GetxController {
  var isLoading = true.obs;
  var notSearch = true.obs;
  var mangaList = [].obs;

  void searchManga(String keyWord) async {
    notSearch(false);
    try {
      isLoading(true);
      var dataManga = await ApiService.searchManga(keyWord);
      mangaList.value = dataManga;
    } finally {
      isLoading(false);
      notSearch(true);
    }
  }
}
