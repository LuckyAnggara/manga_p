import 'package:get/get.dart';
import 'package:quizapp/models/read_model.dart';
import 'package:quizapp/services/api_service.dart';

class ReadController extends GetxController {
  var isLoading = true.obs;
  var data = ReadModel().obs;

  void readManga(String linkId) async {
    try {
      isLoading(true);
      var dataManga = await ApiService.readManga(linkId);
      data.value = dataManga;
    } finally {
      isLoading(false);
    }
  }
}
