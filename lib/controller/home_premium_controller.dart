import 'package:get/get.dart';
import 'package:quizapp/services/api_service.dart';

class HomePremiumController extends GetxController {
  var isLoading = true.obs;
  var mangaList = [].obs;

  @override
  void onInit() {
    fetchManga();
    super.onInit();
  }

  void fetchManga() async {
    try {
      isLoading(true);
      var dataManga = await ApiService.fetchHomePremium();
      mangaList.value = dataManga;
    } finally {
      isLoading(false);
    }
  }
}
