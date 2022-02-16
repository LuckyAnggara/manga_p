import 'package:get/get.dart';
import 'package:quizapp/services/api_service.dart';

class HomePremiumController extends GetxController {
  var isLoading = true.obs;
  var mangaList = [].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    fetchManga();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
