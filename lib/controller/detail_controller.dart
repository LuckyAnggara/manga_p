import 'package:get/get.dart';
import 'package:quizapp/models/detail_model.dart';
import 'package:quizapp/services/api_service.dart';

class DetailController extends GetxController {
  var isLoading = true.obs;
  var detail = DetailModel().obs;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

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
