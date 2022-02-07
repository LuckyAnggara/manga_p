import 'package:get/get.dart';
import 'package:quizapp/models/detail_model.dart';
import 'package:quizapp/services/api_service.dart';

class DetailController extends GetxController {
  var isLoading = true.obs;
  var detail = DetailModel().obs;

  void fetchDetail(String linkId) async {
    try {
      isLoading(true);
      var dataManga = await ApiService.fetchDetailManga(linkId);
      detail.value = dataManga;
    } finally {
      isLoading(false);
    }
  }
}
